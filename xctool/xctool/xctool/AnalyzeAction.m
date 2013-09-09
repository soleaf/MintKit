//
// Copyright 2013 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "AnalyzeAction.h"

#import "EventSink.h"
#import "Options.h"
#import "XCToolUtil.h"
#import "XcodeSubjectInfo.h"
#import "BuildStateParser.h"
#import "ReporterEvents.h"

@interface BuildTargetsCollector : NSObject <EventSink>
/// Array of @{@"projectName": projectName, @"targetName": targetName}
@property (nonatomic, retain) NSMutableSet *seenTargets;
@end

@implementation BuildTargetsCollector

- (instancetype)init
{
  if (self = [super init]) {
    self.seenTargets = [NSMutableSet set];
  }
  return self;
}

- (void)publishDataForEvent:(NSData *)data
{
  NSError *error = nil;
  NSDictionary *event = [NSJSONSerialization JSONObjectWithData:data
                                                        options:0
                                                          error:&error];
  NSAssert(event != nil, @"Error decoding JSON: %@", [error localizedFailureReason]);

  if ([event[@"event"] isEqualTo:kReporter_Events_BeginBuildTarget]) {
    [self.seenTargets addObject:@{
     @"projectName": event[kReporter_BeginBuildTarget_ProjectKey],
     @"targetName": event[kReporter_BeginBuildTarget_TargetKey],
     }];
  }
}

@end

@interface AnalyzeAction ()
@property (nonatomic, retain) NSMutableSet *onlySet;
@property (nonatomic, assign) BOOL skipDependencies;
@property (nonatomic, assign) BOOL failOnWarnings;
@end

@implementation AnalyzeAction

+ (NSString *)name
{
  return @"analyze";
}

+ (NSArray *)options
{
  return @[[Action actionOptionWithName:@"only"
                                aliases:nil
                            description:
            @"only analyze selected targets, can be used more than once.\n"
            "\tIf this option is specified, its dependencies are assumed to be built."
                              paramName:@"TARGET"
                                  mapTo:@selector(addOnlyOption:)
            ],
           [Action actionOptionWithName:@"skip-deps"
                                aliases:nil
                            description:@"Skip initial build of the scheme"
                                setFlag:@selector(setSkipDependencies:)],
           [Action actionOptionWithName:@"failOnWarnings"
                                aliases:nil
                            description:@"Fail builds if analyzer warnings are found"
                                setFlag:@selector(setFailOnWarnings:)],
           ];
}

/*! Retrieve the location of the intermediate directory
 */
+ (NSString *)intermediatesDirForProject:(NSString *)projectName
                                  target:(NSString *)targetName
                           configuration:(NSString *)configuration
                                platform:(NSString *)platform
                                 objroot:(NSString *)objroot
{
  return [NSString pathWithComponents:@[
          objroot,
          [projectName stringByAppendingPathExtension:@"build"],
          [NSString stringWithFormat:@"%@%@", configuration, platform ?: @""],
          [targetName stringByAppendingPathExtension:@"build"],
          ]];
}

/*! Normalize the "path" of the diagnostic.

 @return NSArray of path elements, each of whic are dictionaries in the form:
          { "file": string,
            "line": int,
            "col": int,
            "message"  : string
          }
 */
+ (NSArray *)contextFromDiagPath:(NSArray *)path fileMap:(NSArray *)files
{
  NSMutableArray *result = [NSMutableArray array];
  for (NSDictionary *piece in path) {
    if ([piece[@"kind"] isEqual:@"event"]) {
      NSDictionary *location = piece[@"location"];
      [result addObject:@{@"file" : files[[location[@"file"] intValue]],
                          @"line" : location[@"line"],
                          @"col" : location[@"col"],
                          @"message" : piece[@"message"]}];
    }
  }
  return result;
}

+ (void)emitAnalyzerWarningsForProject:(NSString *)projectName
                                target:(NSString *)targetName
                               options:(Options *)options
                      xcodeSubjectInfo:(XcodeSubjectInfo *)xcodeSubjectInfo
                           toReporters:(NSArray *)reporters
                         foundWarnings:(BOOL *)foundWarnings
{
  static NSRegularExpression *analyzerPlistPathRegex = nil;
  if (!analyzerPlistPathRegex) {
    analyzerPlistPathRegex =
    [NSRegularExpression regularExpressionWithPattern:@"^.*/StaticAnalyzer/.*\\.plist$"
                                              options:0
                                                error:0];
  }

  NSString *path = [[self class]
                    intermediatesDirForProject:projectName
                    target:targetName
                    configuration:[options effectiveConfigurationForSchemeAction:@"AnalyzeAction"
                                                                xcodeSubjectInfo:xcodeSubjectInfo]
                    platform:xcodeSubjectInfo.effectivePlatformName
                    objroot:xcodeSubjectInfo.objRoot];
  NSString *buildStatePath = [path stringByAppendingPathComponent:@"build-state.dat"];

  BOOL haveFoundWarnings = NO;

  BuildStateParser *buildState = [[[BuildStateParser alloc] initWithPath:buildStatePath] autorelease];
  for (NSString *path in buildState.nodes) {
    NSTextCheckingResult *result = [analyzerPlistPathRegex
                                    firstMatchInString:path
                                    options:0
                                    range:NSMakeRange(0, path.length)];
    if (result.range.location == NSNotFound) {
      continue;
    }

    NSDictionary *diags = [NSDictionary dictionaryWithContentsOfFile:path];
    for (NSDictionary *diag in diags[@"diagnostics"]) {
      haveFoundWarnings = YES;
      NSString *file = diags[@"files"][[diag[@"location"][@"file"] intValue]];
      file = file.stringByStandardizingPath;
      NSNumber *line = diag[@"location"][@"line"];
      NSNumber *col = diag[@"location"][@"col"];
      NSString *desc = diag[@"description"];
      NSArray *context = [self.class contextFromDiagPath:diag[@"path"]
                                                 fileMap:diags[@"files"]];

      PublishEventToReporters(reporters, @{
       @"event": kReporter_Events_AnalyzerResult,
        kReporter_AnalyzerResult_ProjectKey: projectName,
         kReporter_AnalyzerResult_TargetKey: targetName,
           kReporter_AnalyzerResult_FileKey: file,
           kReporter_AnalyzerResult_LineKey: line,
         kReporter_AnalyzerResult_ColumnKey: col,
    kReporter_AnalyzerResult_DescriptionKey: desc,
        kReporter_AnalyzerResult_ContextKey: context,
       });
    }
  }

  if (foundWarnings) {
    *foundWarnings = haveFoundWarnings;
  }
}

- (id)init
{
  if (self = [super init]) {
    self.onlySet = [NSMutableSet set];
  }
  return self;
}

- (void)addOnlyOption:(NSString *)targetName
{
  [_onlySet addObject:targetName];
}

- (BOOL)performActionWithOptions:(Options *)options
                xcodeSubjectInfo:(XcodeSubjectInfo *)xcodeSubjectInfo
{

  BuildTargetsCollector *buildTargetsCollector = [[[BuildTargetsCollector alloc] init] autorelease];
  NSArray *reporters = [options.reporters arrayByAddingObject:buildTargetsCollector];

  NSArray *buildArgs = [[options xcodeBuildArgumentsForSubject]
                        arrayByAddingObjectsFromArray:
                        [options commonXcodeBuildArgumentsForSchemeAction:@"AnalyzeAction"
                                                         xcodeSubjectInfo:xcodeSubjectInfo]];

  BOOL success = YES;
  if (_onlySet.count) {
    if (!self.skipDependencies) {
      // build everything, and then build with analyze only the specified buildables
      NSArray *args = [buildArgs arrayByAddingObject:@"build"];
      success = RunXcodebuildAndFeedEventsToReporters(args, @"build", [options scheme], reporters);
    }

    if (success) {
      for (NSDictionary *buildable in xcodeSubjectInfo.buildables) {
        if (![buildable[@"forAnalyzing"] boolValue] ||
            ![_onlySet containsObject:buildable[@"target"]]) {
          continue;
        }
        NSArray *args =
        [[options commonXcodeBuildArgumentsForSchemeAction:@"AnalyzeAction"
                                          xcodeSubjectInfo:xcodeSubjectInfo]
         arrayByAddingObjectsFromArray:@[
         @"-project", buildable[@"projectPath"],
         @"-target", buildable[@"target"],
         @"RUN_CLANG_STATIC_ANALYZER=YES",
         [NSString stringWithFormat:@"OBJROOT=%@", xcodeSubjectInfo.objRoot],
         [NSString stringWithFormat:@"SYMROOT=%@", xcodeSubjectInfo.symRoot],
         [NSString stringWithFormat:@"SHARED_PRECOMPS_DIR=%@", xcodeSubjectInfo.sharedPrecompsDir],
         ]];
        success &= RunXcodebuildAndFeedEventsToReporters(args, @"analyze", [options scheme], reporters);
      }
    }
  } else {
    NSArray *args = [buildArgs arrayByAddingObjectsFromArray:@[
                     @"RUN_CLANG_STATIC_ANALYZER=YES",
                     @"build"]];
    success = RunXcodebuildAndFeedEventsToReporters(args, @"analyze", [options scheme], reporters);
  }

  if (!success) {
    return NO;
  }

  BOOL haveFoundWarnings = NO;

  for (NSDictionary *buildable in buildTargetsCollector.seenTargets) {
    if (_onlySet.count && ![_onlySet containsObject:buildable[@"targetName"]]) {
      continue;
    }

    BOOL foundWarningsInBuildable = NO;
    [self.class emitAnalyzerWarningsForProject:buildable[@"projectName"]
                                        target:buildable[@"targetName"]
                                       options:options
                              xcodeSubjectInfo:xcodeSubjectInfo
                                   toReporters:options.reporters
                                 foundWarnings:&foundWarningsInBuildable];
    haveFoundWarnings |= foundWarningsInBuildable;
  }

  if (self.failOnWarnings) {
    return !haveFoundWarnings;
  } else {
    return YES;
  }
}

@end
