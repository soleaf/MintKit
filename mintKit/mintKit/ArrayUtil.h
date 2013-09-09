//
//  ArrayUtil.m
//  travelogue
//
//  Created by flonelin on 13. 7. 12..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
    NSArray Utilities
 
 */

@interface ArrayUtil : NSObject


/*
 
 Organization
 
 */

// Make array with two object per row.
+ (NSMutableArray *) ArrayWithTwoPerRow:(NSArray *)array;
// Make array with user setted numer of items per row.
+ (NSMutableArray *) ArrayWith:(NSArray*) array itemsPer1Row:(NSInteger) num;

@end
