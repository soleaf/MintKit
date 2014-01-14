//
//  UIView+frame.h
//
//  Created by soleaf on 2013. 11. 9..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

- (float)sizeWidth;
- (float)sizeHeight;
- (void)setSizeWidth:(float)newWidth;
- (void)setSizeHeight:(float)newHeight;

- (float)originX;
- (float)originY;
- (void)setOriginX:(float)newX;
- (void)setOriginY:(float)newY;

@end
