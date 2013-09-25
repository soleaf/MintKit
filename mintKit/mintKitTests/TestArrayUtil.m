//
//  TestArrayUtil.m
//  mintKit
//
//  Created by soleaf on 13. 9. 20..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "TestArrayUtil.h"
#import "ArrayUtil.h"

@implementation TestArrayUtil

- (void) testArrayWithitemsPer1Row
{
    // Making number array 0~1000
    NSMutableArray *testSource = [[NSMutableArray alloc] init];
    for (NSInteger num = 0; num < 1000; num++){
        [testSource addObject:[NSString stringWithFormat:@"%d",num]];
    }
    
    NSArray *items3PerRow = [ArrayUtil ArrayWith:testSource itemsPer1Row:3];
    
    NSInteger count = 0;
    for (NSInteger rownum = 0; rownum <items3PerRow.count; rownum++){
        
        NSArray* targetRowArray = [items3PerRow objectAtIndex:rownum];
        
        for (NSInteger num = 0; num < targetRowArray.count ; num++){
            
            STAssertTrue([[targetRowArray objectAtIndex:num] integerValue] == count, @"Array item is not matched");
//            NSLog(@"row:%d:%d array item :%@, count:%d",rownum, num, [targetRowArray objectAtIndex:num], count);
            
            count++;
        }
    }
}

- (void) testArrayWithTwoPerRow
{
    // Making number array 0~1000
    NSMutableArray *testSource = [[NSMutableArray alloc] init];
    for (NSInteger num = 0; num < 1000; num++){
        [testSource addObject:[NSString stringWithFormat:@"%d",num]];
    }
    
    NSArray *items2PerRow = [ArrayUtil ArrayWithTwoPerRow:testSource];
    
    NSInteger count = 0;
    for (NSInteger rownum = 0; rownum <items2PerRow.count; rownum++){
        
        NSArray* targetRowArray = [items2PerRow objectAtIndex:rownum];
        
        for (NSInteger num = 0; num < targetRowArray.count ; num++){
            
            STAssertTrue([[targetRowArray objectAtIndex:num] integerValue] == count, @"Array item is not matched");
            //            NSLog(@"row:%d:%d array item :%@, count:%d",rownum, num, [targetRowArray objectAtIndex:num], count);
            
            count++;
        }
    }
}
@end
