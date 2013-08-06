//
//  ObjectUtil.m
//  travelogue
//
//  Created by flonelin on 13. 7. 30..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "ObjectUtil.h"

@implementation ObjectUtil


// 비교연산

/**
 Description: CGPoint끼리 같은지 여부 확인
 Factors    : CGPoint, CGPoint
 Return     : BOOL
 **/

+ (BOOL)CGPoint:(CGPoint)point isEqual:(CGPoint)diffPoint
{
    if      (point.x != diffPoint.x) return     NO;
    else if (point.y != diffPoint.y) return     NO;
    else                             return     YES;
}


@end