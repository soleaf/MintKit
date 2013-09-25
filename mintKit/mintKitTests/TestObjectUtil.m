//
//  TestObjectUtil.m
//  mintKit
//
//  Created by soleaf on 13. 9. 25..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "TestObjectUtil.h"
#import "ObjectUtil.h"

@implementation TestObjectUtil

- (void)testCGPointisEqual
{
    
    STAssertTrue([ObjectUtil CGPoint:CGPointMake(20, 52) isEqual:CGPointMake(20, 52)], @"Result should be true.");
    STAssertTrue(![ObjectUtil CGPoint:CGPointMake(20, 52) isEqual:CGPointMake(55, 12)], @"Result should be false.");
}

@end
