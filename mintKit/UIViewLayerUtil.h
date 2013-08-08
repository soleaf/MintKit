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
 */

@interface UIViewLayerUtil : NSObject

// Drop shadows
+ (void) dropShadow:(UIView *) view Opacity:(float)opacity andOffset:(CGSize) offset andColor:(UIColor*) color;
+ (void) dropShadow:(UIView *) view Opacity:(float)opacity andOffset:(CGSize) offset;

// Fill gradient
+ (void) gradient:(UIView *) view start:(UIColor *)startColor endColor:(UIColor*) endColor;

@end
