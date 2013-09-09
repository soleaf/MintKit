//
//  mintKitTests.m
//  mintKitTests
//
//  Created by soleaf on 13. 9. 9..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "mintKitTests.h"
#import "StringUtil.h"

@implementation mintKitTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testStringUtilHasLength1
{
    STAssertTrue([StringUtil hasLength:@"test"], @"OK");
}

- (void)testStringUtilHasLength2
{
    STAssertTrue(![StringUtil hasLength:nil], @"OK");
}
@end
