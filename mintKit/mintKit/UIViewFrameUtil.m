//
//  UIViewFrameUtil.m
//  mintKit
//
//  Created by soleaf on 13. 7. 18..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//


#import "UIViewFrameUtil.h"
#import "TestKit.h"

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

+ (void)move:(UIView *)view morePoint:(CGPoint)point
{
    CGRect frame = view.frame;
    frame.origin.x += point.x;
    frame.origin.y += point.y;
    
    view.frame = frame;
}

+ (void)move:(UIView *)view toX:(float)offset
{
    CGRect frame = view.frame;
    frame.origin.x = offset;
    
    view.frame = frame;
}

+ (void)move:(UIView *)view toPoint:(CGPoint)point
{
    CGRect frame = view.frame;
    frame.origin = point;
    
    view.frame = frame;
}

+ (void)size:(UIView *)view height:(float)height
{
    CGRect frame = view.frame;
    frame.size.height = height;
    view.frame = frame;
}

+ (void)size:(UIView *)view width:(float)width
{
    CGRect frame = view.frame;
    frame.size.width = width;
    view.frame = frame;
}

+ (void)size:(UIView *)view width:(float)width andHeight:(float)height
{
    CGRect frame = view.frame;
    frame.size.width = width;
    frame.size.width = height;
    view.frame = frame;
}


+ (void)frame:(UIView *)view height:(float)height
{
    [TestKit methodisDeprecated:MINTKIT_DEBUG_METHOD moveTo:@"size:(UIView *)view height:(float)height"];
    CGRect frame = view.frame;
    frame.size.height = height;
    view.frame = frame;
}

+ (void)frame:(UIView *)view width:(float)width
{
    [TestKit methodisDeprecated:MINTKIT_DEBUG_METHOD moveTo:@"size:(UIView *)view width:(float)width"];
    CGRect frame = view.frame;
    frame.size.width = width;
    view.frame = frame;
}

+ (void)frame:(UIView *)view w:(float)width andH:(float)height
{
    [TestKit methodisDeprecated:MINTKIT_DEBUG_METHOD moveTo:@"size:(UIView *)view width:(float)width andHeight:(float)height"];
    CGRect frame = view.frame;
    frame.size.width = width;
    frame.size.width = height;
    view.frame = frame;
}

+ (void)size:(UIView *)view moreHeight:(float)height
{
    CGRect frame = view.frame;
    frame.size.height += height;
    view.frame = frame;
}

+ (void)size:(UIView *)view moreWidth:(float)width
{
    CGRect frame = view.frame;
    frame.size.width += width;
    view.frame = frame;
}

+ (void)size:(UIView *)view moreWidth:(float)width andMoreHeight:(float)height
{
    CGRect frame = view.frame;
    frame.size.width += width;
    frame.size.width += height;
    view.frame = frame;
}


+ (void)frame:(UIView *)view moreH:(float)height
{
    [TestKit methodisDeprecated:MINTKIT_DEBUG_METHOD moveTo:@"size:(UIView *)view moreHeight:(float)height"];
    CGRect frame = view.frame;
    frame.size.height += height;
    view.frame = frame;
}

+ (void)frame:(UIView *)view moreW:(float)width
{
    [TestKit methodisDeprecated:MINTKIT_DEBUG_METHOD moveTo:@"size:(UIView *)view moreWidth:(float)width"];
    CGRect frame = view.frame;
    frame.size.width += width;
    view.frame = frame;
}

+ (void)frame:(UIView *)view moreW:(float)width andMoreH:(float)height
{
    [TestKit methodisDeprecated:MINTKIT_DEBUG_METHOD moveTo:@"size:(UIView *)view moreWidth:(float)width andMoreHeight:(float)height"];
    CGRect frame = view.frame;
    frame.size.width += width;
    frame.size.width += height;
    view.frame = frame;
}

+(CGSize)size:(UILabel *)label fitByTextConstrainedSize :(CGSize)contrainedSize
{
    CGRect frame = label.frame;
    frame.size = [label.text sizeWithFont:label.font
                        constrainedToSize:contrainedSize];
    label.frame = frame;
    label.numberOfLines = 0;
    
    return frame.size;
}


+(CGSize)frame:(UILabel *)label fitByTextConstrainedSize :(CGSize)contrainedSize
{
    CGRect frame = label.frame;
    frame.size = [label.text sizeWithFont:label.font
                        constrainedToSize:contrainedSize];
    label.frame = frame;
    label.numberOfLines = 0;
    
    return frame.size;
}

@end
