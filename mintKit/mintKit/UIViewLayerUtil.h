//
//  UIViewLayerUtil.h
//  mintKit
//
//  Created by soleaf on 13. 7. 29..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
    Make UIView Layer by One line code.
    For drop shadow, gradient, etc...
 */

enum UIViewLayerBorderPosition{
    UIViewLayerBorderTop = 0,
    UIViewLayerBorderRight,
    UIViewLayerBorderBottom,
    UIViewLayerBorderLeft
    };
typedef NSInteger UIViewLayerBorderPosition;

@interface UIViewLayerUtil : NSObject

// Drop shadows
+ (void)dropShadow:(UIView *)view
           Opacity:(float)opacity
         andOffset:(CGSize)offset
          andColor:(UIColor *)color
            radius:(float)radius;

+ (void) dropShadow:(UIView *) view
            Opacity:(float)opacity
          andOffset:(CGSize) offset
           andColor:(UIColor*) color;

+ (void) dropShadow:(UIView *) view
            Opacity:(float)opacity
          andOffset:(CGSize) offset;

// Fill vertical gradient
+ (void) gradient:(UIView *) view
            start:(UIColor *)startColor
         endColor:(UIColor*) endColor;

+ (void) gradient:(UIView *) view
           colors:(NSArray*)colorArray; // (colorArray: UIColor array)

// Make border
+ (void) border:(UIView*) view
           size:(float) size
       andColor:(UIColor*) color;

+ (void) border:(UIView*) view
           size:(float) size
       andColor:(UIColor*) color
      andRadius:(float) radius;

+ (CALayer*) border:(UIView*) view
               size:(float) size
           andColor:(UIColor*) color
              where:(UIViewLayerBorderPosition) position;


@end
