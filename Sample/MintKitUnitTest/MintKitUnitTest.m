//
//  MintKitUnitTest.m
//  MintKitUnitTest
//
//  Created by soleaf on 13. 9. 9..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "MintKitUnitTest.h"

@implementation MintKitUnitTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    appDelegate         = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    mainViewCtr         = appDelegate.mainCtr;
    animatingButton     = mainViewCtr.ui_button;
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testStringUtilHaslengthNil
{
    // nil
    NSString *originStr = nil;
    BOOL hasLength = [StringUtil hasLength:originStr];
    STAssertTrue(!hasLength, @"nil has not length");
}

- (void)testStringUtilHasLengthBlank
{
    // blank
    NSString *originStr = @"  ";
    BOOL hasLength = [StringUtil hasLength:originStr];
    STAssertTrue(!hasLength, @"blank has no length");
}

@end
