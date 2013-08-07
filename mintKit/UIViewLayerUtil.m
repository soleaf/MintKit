//
//  UIViewLayerUtil.m
//  travelogue
//
//  Created by flonelin on 13. 7. 29..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

// 설 명 : UIView Layer를 쉽게 사용할 수 있도록 묶음
// 주 의 : <# 주의사항설명 #>
// 사 용 : Shadow 등

#import <QuartzCore/QuartzCore.h>

#import "UIViewLayerUtil.h"

@implementation UIViewLayerUtil


+ (void)dropShadow:(UIView *)view Opacity:(float)opacity andOffset:(CGSize)offset andColor:(UIColor *)color
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:view.bounds];
    view.layer.masksToBounds = NO;
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = offset;
    view.layer.shadowOpacity = opacity;
    view.layer.shadowPath = shadowPath.CGPath;
}

+ (void)dropShadow:(UIView *)view Opacity:(float)opacity andOffset:(CGSize)offset
{
    [UIViewLayerUtil dropShadow:view Opacity:opacity andOffset:offset andColor:[UIColor blackColor]];
}


/**
 Description: 그라디언트 뿌리기
 Factors    : <# 인자 #>
 Return     : <# 반환 #>
 **/
+ (void)gradient:(UIView *)view start:(UIColor *)startColor endColor:(UIColor *)endColor
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
    [view.layer insertSublayer:gradient atIndex:0];
}

@end