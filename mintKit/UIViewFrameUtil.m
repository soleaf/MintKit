//
//  UIViewFrameUtil.m
//  mintKit
//
//  Created by soleaf on 13. 7. 18..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//


#import "UIViewFrameUtil.h"

@implementation UIViewFrameUtil


+ (void)move:(UIView *)view moreY:(float)offset
{
    CGRect frame = view.frame;
    frame.origin.y += offset;
    
    view.frame = frame;
}

+ (void)move:(UIView *)view toY:(float)offset
{
    CGRect frame = view.frame;
    frame.origin.y = offset;
    
    view.frame = frame;
}

+ (void)move:(UIView *)view moreX:(float)offset
{
    CGRect frame = view.frame;
    frame.origin.x += offset;
    
    view.frame = frame;
}

+ (void)move:(UIView *)view toX:(float)offset
{
    CGRect frame = view.frame;
    frame.origin.x = offset;
    
    view.frame = frame;
}


+ (void)frame:(UIView *)view height:(float)height
{
    CGRect frame = view.frame;
    frame.size.height = height;
    view.frame = frame;
}

+ (void)frame:(UIView *)view width:(float)width
{
    CGRect frame = view.frame;
    frame.size.width = width;
    view.frame = frame;
}

+ (void)frame:(UIView *)view w:(float)width andH:(float)height
{
    CGRect frame = view.frame;
    frame.size.width = width;
    frame.size.width = height;
    view.frame = frame;
}

+ (void)frame:(UIView *)view moreH:(float)height
{
    CGRect frame = view.frame;
    frame.size.height += height;
    view.frame = frame;
}

+ (void)frame:(UIView *)view moreW:(float)width
{
    CGRect frame = view.frame;
    frame.size.width += width;
    view.frame = frame;
}

+ (void)frame:(UIView *)view moreW:(float)width andMoreH:(float)height
{
    CGRect frame = view.frame;
    frame.size.width += width;
    frame.size.width += height;
    view.frame = frame;
}



@end
