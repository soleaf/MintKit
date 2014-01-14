//
//  UIViewLayerUtil.m
//  mintKit
//
//  Created by soleaf on 13. 7. 29..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "UIViewLayerUtil.h"
#import "UIView+frame.h"


@implementation UIViewLayerUtil

+(void)dropShadow:(UIView *)view Opacity:(float)opacity andOffset:(CGSize)offset andColor:(UIColor *)color radius:(float)radius
{
    UIBezierPath *shadowPath    = [UIBezierPath bezierPathWithRect:view.bounds];
    view.layer.masksToBounds    = NO;
    view.layer.shadowColor      = color.CGColor;
    view.layer.shadowOffset     = offset;
    view.layer.shadowOpacity    = opacity;
    view.layer.shadowPath       = shadowPath.CGPath;
    view.layer.shadowRadius     = radius;
}

+ (void)dropShadow:(UIView *)view Opacity:(float)opacity andOffset:(CGSize)offset andColor:(UIColor *)color
{
    [UIViewLayerUtil dropShadow:view Opacity:opacity andOffset:offset andColor:color radius:1.0];
    
}

+ (void)dropShadow:(UIView *)view Opacity:(float)opacity andOffset:(CGSize)offset
{
    [UIViewLayerUtil dropShadow:view Opacity:opacity andOffset:offset andColor:[UIColor blackColor]];
}

+ (void)gradient:(UIView *)view start:(UIColor *)startColor endColor:(UIColor *)endColor
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame            = view.bounds;
    gradient.colors           = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
    [view.layer insertSublayer:gradient atIndex:0];
}

+ (void)gradient:(UIView *)view colors:(NSArray *)colorArray
{
    NSMutableArray *cgColorArray = [[NSMutableArray alloc] init];
    for (UIColor *color in colorArray) {
        [cgColorArray addObject:(id)[color CGColor]];
    }
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame            = view.bounds;
    gradient.colors           = cgColorArray;
    [view.layer insertSublayer:gradient atIndex:0];
}

+ (void)border:(UIView *)view size:(float)size andColor:(UIColor*)color
{
    view.layer.borderWidth  = size;
    view.layer.borderColor  = color.CGColor;
}

+ (void)border:(UIView *)view size:(float)size andColor:(UIColor*)color andRadius:(float)radius
{
    view.layer.borderWidth  = size;
    view.layer.borderColor  = color.CGColor;
    view.layer.cornerRadius = radius;
}

+ (CALayer*) border:(UIView*) view
           size:(float) size
       andColor:(UIColor*) color
          where:(UIViewLayerBorderPosition) position
{
    
    CALayer *border = [CALayer layer];
    
    switch (position) {
        case UIViewLayerBorderTop:
            border.frame = CGRectMake(0.0f, 0, view.sizeWidth, size);
            break;
        case UIViewLayerBorderRight:
            border.frame = CGRectMake(view.sizeWidth, 0, size, view.sizeHeight);
            break;
        case UIViewLayerBorderBottom:
            border.frame = CGRectMake(0.0, view.sizeHeight, view.sizeWidth, size);
            break;
        case UIViewLayerBorderLeft:
            border.frame = CGRectMake(0, 0, size, view.sizeHeight);
            break;
        default:
            break;
    }
    
    border.backgroundColor = color.CGColor;
    [view.layer addSublayer:border];
    
    return border;
    
}

@end
