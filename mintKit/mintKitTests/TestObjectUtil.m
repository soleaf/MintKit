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

- (void)testDeepCopyNSMutableDictionary
{
    NSString *string1 = @"hoy";
    NSString *string2 = @"hi";
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:string1,@"s1",string2,@"s2",nil];
    NSMutableDictionary *dicCopied = [ObjectUtil deepCopyNSMutableDictionary:dic];
    
    // contents check
    STAssertTrue([[dicCopied objectForKey:@"s1"] isEqualToString:[dic objectForKey:@"s1"]], @"contents");
    STAssertTrue([[dicCopied objectForKey:@"s2"] isEqualToString:[dic objectForKey:@"s2"]], @"contents");
    
    [dic removeAllObjects];
    
    // address check -> should be diffrence
    STAssertFalse(dic == dicCopied, @"object address");
    STAssertTrue([dicCopied objectForKey:@"s1"], @"object address");
    STAssertTrue([dicCopied objectForKey:@"s2"], @"object address");
    
}

- (void)testDeepCopyNSMutableArray
{
    
    NSString *string1 = @"hoy";
    NSString *string2 = @"hi";
    NSString *string3 = @"ney";
    
    NSMutableArray *originArray = [[NSMutableArray alloc] initWithObjects:string1,string2,string3, nil];
    NSMutableArray *copiedArray = [ObjectUtil deepCopyNSMutableArray:originArray];
    
    // contents check
    for (NSInteger i =0; i < copiedArray.count; i++){
        STAssertTrue([[copiedArray objectAtIndex:i] isEqualToString:[originArray objectAtIndex:i]], @"contents");
    }
    
    [originArray removeAllObjects];

    // address check -> should be diffrence
    STAssertFalse(copiedArray == originArray, @"object address");
    for (NSInteger i =0; i < copiedArray.count; i++){
        STAssertTrue([copiedArray objectAtIndex:i], @"object address");
    }

}

@end
