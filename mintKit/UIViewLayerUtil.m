//
//  UIViewLayerUtil.m
//  mintKit
//
//  Created by soleaf on 13. 7. 29..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

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

+ (void)gradient:(UIView *)view start:(UIColor *)startColor endColor:(UIColor *)endColor
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
    [view.layer insertSublayer:gradient atIndex:0];
}

@end
