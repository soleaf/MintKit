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

// Animate Fade In and Out to a alpha value.
+ (void) fadeInOut:(UIView*)view toAlpha:(float)alpha interval:(float)time callBack:(void (^)(void))callback;

/*
 Move
 */
// Moving Animation relative pos
+ (void) move:(UIView *) view moreX:(float)x;
+ (void) move:(UIView *) view moreX:(float)x interval:(float)time callBack:(void(^)(void))callBack;
+ (void) move:(UIView *) view moreY:(float)y;
+ (void) move:(UIView *) view moreY:(float)y interval:(float)time callBack:(void(^)(void))callBack;
+ (void) move:(UIView *) view morePoint:(CGPoint)morePont interval:(float)time callBack:(void(^)(void))callBack;

// Moving Animation absolute pos 
+ (void) move:(UIView *) view toX:(float)x;
+ (void) move:(UIView *) view toX:(float)x interval:(float)time callBack:(void(^)(void))callBack;
+ (void) move:(UIView *) view toY:(float)y;
+ (void) move:(UIView *) view toY:(float)y interval:(float)time callBack:(void(^)(void))callBack;
+ (void) move:(UIView *) view toPoint:(CGPoint)point interval:(float)time callBack:(void(^)(void))callBack;


/*
 In and out +
 Animate moving view.
 */

// FadeIn + Move
// It move +/-fromMoreY or x to current setted frame.origin.y or x
// animate more pos -> current pos
+ (void) fadeInMove:(UIView *)view fromMoreY:(float)y interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeInMove:(UIView *)view fromMoreX:(float)x interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeInMove:(UIView *)view fromMorePoint:(CGPoint) morePoint interval:(float)time callBack:(void(^)(void))callback;
// It move current setted frame.origin.y or x to +/-fromMoreY or x
// animate current pos -> more pos
+ (void) fadeInMove:(UIView *)view moreY:(float)y interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeInMove:(UIView *)view moreX:(float)x interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeInMove:(UIView *)view morePoint:(CGPoint)morePoint interval:(float)time callBack:(void(^)(void))callback;

// FadeOut + Move
// It move +/-fromMoreY or x to current setted frame.origin.y or x
// animate more pos -> current pos
+ (void) fadeOutMove:(UIView *)view fromMoreY:(float)y interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeOutMove:(UIView *)view fromMoreX:(float)x interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeOutMove:(UIView *)view fromMorePoint:(CGPoint) morePoint interval:(float)time callBack:(void(^)(void))callback;
// It move current setted frame.origin.y or x to +/-fromMoreY or x
// animate current pos -> more pos
+ (void) fadeOutMove:(UIView *)view moreY:(float)y interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeOutMove:(UIView *)view moreX:(float)x interval:(float)time callBack:(void(^)(void))callback;
+ (void) fadeOutMove:(UIView *)view morePoint:(CGPoint)morePoint interval:(float)time callBack:(void(^)(void))callback;

@end
