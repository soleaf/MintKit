//
//  GraphicsUtil.ㅡ
//  mintKit
//
//  Created by soleaf on 13. 1. 11..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//
#import "GraphicsUtil.h"

@implementation GraphicsUtil

+ (UIImage*)minimizeWithImage:(UIImage*)image scaledToSize:(CGSize)newSize mindetectingSize: (CGSize)minSize
{
    if (image.size.height >= minSize.height && image.size.width >= minSize.width)
        return [self resizeWithImage:image toSize:newSize];
    else
        return image;
}

+ (UIImage*)minimizeWithImage:(UIImage*)image minWithHeight: (float)min
{
    if (image.size.width > min){ // 가로가 크면, 가로를최소에 고정, 세로를 맞춤
        float sizeHeight = image.size.height * min / image.size.width;
        CGSize newSize = CGSizeMake(min, sizeHeight);
        
        image = [self resizeWithImage:image toSize:newSize];
    }
    
    if (image.size.height > min){
        float sizeWidth = image.size.width * min / image.size.height;
        CGSize newSize = CGSizeMake(sizeWidth, min);
        
        return [self resizeWithImage:image toSize:newSize];
    }
    
    return image;
}

+ (UIImage*)resizeWithImage:(UIImage*)image toSize:(CGSize)newSize
{
    
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width+1,newSize.height+1)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}


+ (CAKeyframeAnimation*)dockBounceAnimationWithViewHeight:(CGFloat)viewHeight
{
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

@end
