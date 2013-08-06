//
//  GraphicsUtil.h
//  travelogue
//
//  Created by ilho Ahn on 1/11/13.
//  Copyright (c) 2013 soleaf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GraphicsUtil : NSObject

+ (UIImage*)minimizeWithImage:(UIImage*)image scaledToSize:(CGSize)newSize mindetectingSize: (CGSize)minSize;
+ (UIImage*)minimizeWithImage:(UIImage*)image mindetectingWith: (float)minWith;
+ (UIImage*)sacleWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (CAKeyframeAnimation*)dockBounceAnimationWithViewHeight:(CGFloat)viewHeight;
@end
