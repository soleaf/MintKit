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

#import <Foundation/Foundation.h>

#import "Reporter.h"

@class ReportWriter;

@interface TextReporter : Reporter
{
@public
  BOOL _isPretty;

  NSUInteger _testsTotal;
  NSUInteger _testsPassed;

  NSDictionary *_currentStatusEvent;
}

@property (nonatomic, retain) NSDictionary *currentBuildCommandEvent;
@property (nonatomic, assign) BOOL testHadOutput;
@property (nonatomic, assign) BOOL testOutputEndsInNewline;
@property (nonatomic, retain) ReportWriter *reportWriter;
@property (nonatomic, retain) NSMutableArray *failedTests;
@property (nonatomic, retain) NSString *currentBundle;
@property (nonatomic, retain) NSMutableArray *analyzerWarnings;

/**
 Returns an NSString that contains lines of context around errorLine with a mark at colNumber.
 */
+ (NSString *)getContext:(NSString *)filePath errorLine:(int)errorLine colNumber:(int)colNumber;

/**
 Returns an NSString that contains lines of context around errorLine.
 */
+ (NSString *)getContext:(NSString *)filePath errorLine:(int)errorLine;

@end

@interface PrettyTextReporter : TextReporter
@end

@interface PlainTextReporter : TextReporter
@end
