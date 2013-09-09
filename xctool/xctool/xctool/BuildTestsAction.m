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

#import "BuildTestsAction.h"

#import "Buildable.h"
#import "Options.h"
#import "SchemeGenerator.h"
#import "TaskUtil.h"
#import "Testable.h"
#import "XcodeSubjectInfo.h"
#import "XCToolUtil.h"

@implementation BuildTestsAction

+ (NSString *)name
{
  return @"build-tests";
}

+ (NSArray *)options
{
  return @[
  [Action actionOptionWithName:@"only"
                       aliases:nil
                   description:@"build only a specific test TARGET"
                     paramName:@"TARGET"
                         mapTo:@selector(addOnly:)],
    [Action actionOptionWithName:@"skip-deps"
                         aliases:nil
                     description:@"Only build the target, not its dependencies"
                         setFlag:@selector(setSkipDependencies:)],
  ];
}

+ (BOOL)buildWorkspace:(NSString *)path
                scheme:(NSString *)scheme
             reporters:(NSArray *)reporters
               objRoot:(NSString *)objRoot
               symRoot:(NSString *)symRoot
     sharedPrecompsDir:(NSString *)sharedPrecompsDir
        xcodeArguments:(NSArray *)xcodeArguments
          xcodeCommand:(NSString *)xcodeCommand
{
  NSArray *taskArguments =
  [xcodeArguments arrayByAddingObjectsFromArray:@[
   @"-workspace", path,
   @"-scheme", scheme,
   // By setting these values to match the subject workspace/scheme
   // or project/scheme we're testing, we can reuse the already built
   // products.  Without this, xcodebuild would default to using the
   // generated workspace's DerivedData (which is empty, so everything
   // would get rebuilt).
   [NSString stringWithFormat:@"OBJROOT=%@", objRoot],
   [NSString stringWithFormat:@"SYMROOT=%@", symRoot],
   [NSString stringWithFormat:@"SHARED_PRECOMPS_DIR=%@", sharedPrecompsDir],
   // Override the DerivedData location to be within our temporary directory so
   // we don't accumulate junk in the user's real DerivedData folder.
   //
   // We're generating a new workspace and scheme every time we build
   // or run tests, and so xcodebuild wants to create a directory like
   // 'Tests-dgtnwkoyuhjfcibwyjiprineykfj' in DerivedData for every run.  Since
   // we're overriding OBJROOT/SYMROOM/SHARED_PRECOMPS_DIR, no build output ends
   // up here so the directory serves no purpose.  It's empty except for one
   // 'info.plist' file.
   [@"-IDECustomDerivedDataLocation=" stringByAppendingString:
    [TemporaryDirectoryForAction() stringByAppendingPathComponent:@"DerivedData"]],
   xcodeCommand,
   ]];

  return RunXcodebuildAndFeedEventsToReporters(taskArguments,
                                               @"build",
                                               xcodeCommand,
                                               reporters);
}

+ (BOOL)buildTestables:(NSArray *)testables
               command:(NSString *)command
               options:(Options *)options
      xcodeSubjectInfo:(XcodeSubjectInfo *)xcodeSubjectInfo
{
  SchemeGenerator *schemeGenerator = [SchemeGenerator schemeGenerator];
  schemeGenerator.parallelizeBuildables = xcodeSubjectInfo.parallelizeBuildables;
  schemeGenerator.buildImplicitDependencies = xcodeSubjectInfo.buildImplicitDependencies;

  // For Xcode's Find Implicit Dependencies to work, we must add every project
  // in the subject's workspace to the generated workspace.
  if (options.workspace) {
    NSArray *projectPaths = [XcodeSubjectInfo projectPathsInWorkspace:options.workspace];
    for (NSString *projectPath in projectPaths) {
      [schemeGenerator addProjectPathToWorkspace:projectPath];
    }
  } else if (options.project) {
    [schemeGenerator addProjectPathToWorkspace:options.project];
  } else {
    NSAssert(NO, @"Should have a workspace or a project.");
  }

  for (Testable *testable in testables) {
    [schemeGenerator addBuildableWithID:testable.targetID inProject:testable.projectPath];
  }

  NSArray *xcodebuildArguments = [options commonXcodeBuildArgumentsForSchemeAction:@"TestAction"
                                                                  xcodeSubjectInfo:xcodeSubjectInfo];
  BOOL succeeded = [BuildTestsAction buildWorkspace:[schemeGenerator writeWorkspaceNamed:@"Tests"]
                                             scheme:@"Tests"
                                          reporters:options.reporters
                                            objRoot:xcodeSubjectInfo.objRoot
                                            symRoot:xcodeSubjectInfo.symRoot
                                  sharedPrecompsDir:xcodeSubjectInfo.sharedPrecompsDir
                                     xcodeArguments:xcodebuildArguments
                                       xcodeCommand:command];

  if (!succeeded) {
    return NO;
  }
  return YES;
}

- (id)init
{
  if (self = [super init]) {
    self.onlyList = [NSMutableArray array];
  }
  return self;
}

- (void)dealloc {
  self.onlyList = nil;
  [super dealloc];
}

- (void)addOnly:(NSString *)argument
{
  [self.onlyList addObject:argument];
}

- (BOOL)validateWithOptions:(Options *)options
           xcodeSubjectInfo:(XcodeSubjectInfo *)xcodeSubjectInfo
               errorMessage:(NSString **)errorMessage
{
  for (NSString *target in self.onlyList) {
    if ([xcodeSubjectInfo testableWithTarget:target] == nil) {
      *errorMessage = [NSString stringWithFormat:@"build-tests: '%@' is not a testing target in this scheme.", target];
      return NO;
    }
  }

  return YES;
}

- (NSMutableArray *)buildableList:(NSArray *)buildableList
                  matchingTargets:(NSArray *)targets
{
  NSMutableArray *result = [NSMutableArray array];

  for (Buildable *buildable in buildableList) {
    BOOL add;
    if (targets.count > 0 && [[buildable.executable pathExtension] isEqualToString:@"octest"]) {
      // If we're filtering by target, only add targets that match.
      add = [targets containsObject:buildable.target];
    } else if (_skipDependencies) {
      add = NO;
    } else {
      add = !([buildable isKindOfClass:[Testable class]] && [(Testable *)buildable skipped]);
    }
    if (add) {
      [result addObject:buildable];
    }
  }

  return result;
}

- (BOOL)performActionWithOptions:(Options *)options xcodeSubjectInfo:(XcodeSubjectInfo *)xcodeSubjectInfo
{
  NSArray *buildableList = [self buildableList:[xcodeSubjectInfo testablesAndBuildablesForTest]
                               matchingTargets:self.onlyList];

  if (![BuildTestsAction buildTestables:buildableList
                                command:@"build"
                                options:options
                       xcodeSubjectInfo:xcodeSubjectInfo]) {
    return NO;
  }

  return YES;
}

@end
