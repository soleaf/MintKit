//
//  AnimationUtil.h
//  mintKit
//
//  Created by soleaf on 13. 8. 19..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

/*
    Animation Effect Simple!
    For usually used effets.
 */

@interface AnimationUtil : NSObject

/*
    Effects
 */

// Make UIView animation like dock bounce.
+ (CAKeyframeAnimation*)dockBounceAnimationWithViewHeight:(CGFloat)viewHeight;

/* 
    Animate moving view.
*/
// It move +/-fromMoreY or x to current setted frame.origin.y or x
+ (void) fadeInMove:(UIView *)view fromMoreY:(float)y interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeInMove:(UIView *)view fromMoreX:(float)x interval:(float)time callBack:(void(^)(void))callback;
// It move current setted frame.origin.y or x to +/-fromMoreY or x
+ (void) fadeInMove:(UIView *)view toMoreY:(float)y interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeInMove:(UIView *)view toMoreX:(float)x interval:(float)time callBack:(void(^)(void))callback;

/*
   In and out
*/
// Animate Fade In and Out
+ (void) fadeIn:(UIView *)view;
+ (void) fadeIn:(UIView *)view interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeOut:(UIView *)view;
+ (void) fadeOut:(UIView *)view interval:(float)time callBack:(void(^)(void))callback;

@end
