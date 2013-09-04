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
   In and out
*/
// Animate Fade In and Out
+ (void) fadeIn:(UIView *)view;
+ (void) fadeIn:(UIView *)view interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeOut:(UIView *)view;
+ (void) fadeOut:(UIView *)view interval:(float)time callBack:(void(^)(void))callback;


/*
 Move
 */

+ (void) move:(UIView *) view moreX:(float)x;
+ (void) move:(UIView *) view moreX:(float)x interval:(float)time callBack:(void(^)(void))callBack;
+ (void) move:(UIView *) view moreY:(float)y;
+ (void) move:(UIView *) view moreY:(float)y interval:(float)time callBack:(void(^)(void))callBack;


/*
 In and out + Animate moving view.
 */

// It move +/-fromMoreY or x to current setted frame.origin.y or x
+ (void) fadeInMove:(UIView *)view fromMoreY:(float)y interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeInMove:(UIView *)view fromMoreX:(float)x interval:(float)time callBack:(void(^)(void))callback;
// It move current setted frame.origin.y or x to +/-fromMoreY or x
+ (void) fadeInMove:(UIView *)view moreY:(float)y interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeInMove:(UIView *)view moreX:(float)x interval:(float)time callBack:(void(^)(void))callback;

@end
