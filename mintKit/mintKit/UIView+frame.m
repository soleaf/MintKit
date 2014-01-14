//
//  UIView+frame.m
//
//  Created by soleaf on 2013. 11. 9..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (Frame)

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

-(float)sizeHeight
{
    return self.frame.size.height;
}

-(float)sizeWidth
{
    return self.frame.size.width;
}

-(void)setSizeHeight:(float)newHeight
{
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

-(void)setSizeWidth:(float)newWidth
{
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}

-(float)originX
{
    return self.frame.origin.x;
}

-(float)originY
{
    return self.frame.origin.y;
}

-(void)setOriginX:(float)newX
{
    CGRect frame = self.frame;
    frame.origin.x = newX;
    self.frame = frame;
}

-(void)setOriginY:(float)newY
{
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
}

@end
