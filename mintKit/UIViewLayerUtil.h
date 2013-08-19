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

@interface UIViewLayerUtil : NSObject

// Drop shadows
+ (void) dropShadow:(UIView *) view Opacity:(float)opacity andOffset:(CGSize) offset andColor:(UIColor*) color;
+ (void) dropShadow:(UIView *) view Opacity:(float)opacity andOffset:(CGSize) offset;

// Fill gradient
+ (void) gradient:(UIView *) view start:(UIColor *)startColor endColor:(UIColor*) endColor;

// Make border
+ (void) border:(UIView*) view size:(float) size andColor:(UIColor*) color;
+ (void) border:(UIView*) view size:(float) size andColor:(UIColor*) color andRadius:(float) radius;


@end
