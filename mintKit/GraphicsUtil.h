//
//  GraphicsUtil.h
//  mintKit
//
//  Created by soleaf on 13. 1. 11..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

/*
 
 */

@interface GraphicsUtil : NSObject


+ (UIImage*)minimizeWithImage:(UIImage*)image scaledToSize:(CGSize)newSize mindetectingSize: (CGSize)minSize;

+ (UIImage*)minimizeWithImage:(UIImage*)image mindetectingWith: (float)minWith;

+ (UIImage*)sacleWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

+ (CAKeyframeAnimation*)dockBounceAnimationWithViewHeight:(CGFloat)viewHeight;
@end
