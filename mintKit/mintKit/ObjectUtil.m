//
//  ObjectUtil.m
//  travelogue
//
//  Created by flonelin on 13. 7. 30..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "ObjectUtil.h"

@implementation ObjectUtil


+ (BOOL) CGPoint:(CGPoint) point isEqual:(CGPoint) otherPoint;
{
    if      (point.x != otherPoint.x) return     NO;
    else if (point.y != otherPoint.y) return     NO;
    else                              return     YES;
}


@end