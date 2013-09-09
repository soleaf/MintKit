//
//  ArrayUtil.h
//  travelogue
//
//  Created by flonelin on 13. 7. 12..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "ArrayUtil.h"

@implementation ArrayUtil


+ (NSMutableArray *) ArrayWithTwoPerRow:(NSArray *)array
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

+ (NSMutableArray *)ArrayWith:(NSArray *)array itemsPer1Row:(NSInteger)num
{
    NSMutableArray *mergedArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < array.count; i+=num) {
        
        NSMutableArray *rowSet = [[NSMutableArray alloc] init];
        
        for(NSInteger items = i; items < i+num && items < array.count; items++)
        {
            [rowSet addObject:[array objectAtIndex:items]];
        }
        
        if (rowSet.count > 0) [mergedArray addObject:rowSet];
        
    }
    return mergedArray;
}

@end
