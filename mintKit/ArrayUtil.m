//
//  ArrayUtil.m
//  travelogue
//
//  Created by flonelin on 13. 7. 12..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "ArrayUtil.h"

@implementation ArrayUtil

// 한줄에 두개씩 아이템을 넣은 배열 만들기
+ (NSMutableArray *) makeTwoInOneRowArray:(NSArray *)array
{
    NSMutableArray *mergedArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < array.count; i+=2) {
        
        NSArray *rowSet = nil;
        if (i+1 <= array.count-1)
            rowSet = [[NSArray alloc] initWithObjects:[array objectAtIndex:i], [array objectAtIndex:i+1],nil];
        else
            rowSet = [[NSArray alloc] initWithObjects:[array objectAtIndex:i], nil];
        [mergedArray addObject:rowSet];
        
    }
    return mergedArray;
}

@end
