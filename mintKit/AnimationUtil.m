//
//  AnimationUtil.m
//  mintKit
//
//  Created by soleaf on 13. 8. 19..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "AnimationUtil.h"
#import "UIViewFrameUtil.h"

@implementation AnimationUtil

+ (CAKeyframeAnimation*)dockBounceAnimationWithViewHeight:(CGFloat)viewHeight
{
    // This code is searched on stackoverfollow. but I cant find contributor.
    // If anyone know this code maker, notice to me.
    
    NSUInteger const kNumFactors    = 24;
    CGFloat const kFactorsPerSec    = 30.0f;
    CGFloat const kFactorsMaxValue  = 128.0f;
    CGFloat factors[kNumFactors]    = {0,  30, 53, 80, 114, 126, 128, 128, 124, 114, 100, 83, 60, 32, 0, 5, 18, 30, 24, 20, 15, 0, 8, 0};
    
    NSMutableArray* transforms = [NSMutableArray array];
    
    for(NSUInteger i = 0; i < kNumFactors; i++)
    {
        CGFloat positionOffset  = factors[i] / kFactorsMaxValue * viewHeight;
        CATransform3D transform = CATransform3DMakeTranslation(0.0f, -positionOffset, 0.0f);
        
        [transforms addObject:[NSValue valueWithCATransform3D:transform]];
    }
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.repeatCount           = 1;
    animation.duration              = kNumFactors * 1.0f/kFactorsPerSec;
    animation.fillMode              = kCAFillModeForwards;
    animation.values                = transforms;
    animation.removedOnCompletion   = YES;
    animation.autoreverses          = NO;
    
    return animation;
}

+ (void) fadeInMove:(UIView *)view fromMoreY:(float)y interval:(float)time;
{
    view.alpha = 0.0;
    CGRect endFrame = view.frame;
    [UIViewFrameUtil move:view moreY:y];
    
    [UIView animateWithDuration:time
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         view.frame = endFrame;
                         view.alpha = 1.0;
                         
                     } completion:nil];
    
}

+ (void) fadeInMove:(UIView *)view fromMoreX:(float)x interval:(float)time
{
    view.alpha = 0.0;
    CGRect endFrame = view.frame;
    [UIViewFrameUtil move:view moreX:x];
    
    [UIView animateWithDuration:time
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         view.frame = endFrame;
                         view.alpha = 1.0;
                         
                     } completion:nil];
    
}

+ (void)fadeIn:(UIView *)view
{
    [AnimationUtil fadeIn:view interval:0.3];
}

+ (void)fadeIn:(UIView *)view interval:(float)time
{
    view.alpha = 0.0;
    [UIView animateWithDuration:time
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         view.alpha = 1.0;
                     } completion:nil];
}

+ (void)fadeOut:(UIView *)view
{
    [AnimationUtil fadeOut:view interval:0.3];
}

+ (void)fadeOut:(UIView *)view interval:(float)time
{
    [UIView animateWithDuration:time
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         view.alpha = 0.0;
                     } completion:nil];
}

@end
