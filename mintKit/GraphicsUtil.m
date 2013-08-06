//
//  GraphicsUtil.m
//  travelogue
//
//  Created by ilho Ahn on 1/11/13.
//  Copyright (c) 2013 soleaf. All rights reserved.
//

#import "GraphicsUtil.h"

@implementation GraphicsUtil


// 이미지 사이즈 줄이기: 최소 사이즈 이상 되는 것만 잘라줌
+ (UIImage*)minimizeWithImage:(UIImage*)image scaledToSize:(CGSize)newSize mindetectingSize: (CGSize)minSize
{
    if (image.size.height >= minSize.height && image.size.width >= minSize.width)
        return [self sacleWithImage:image scaledToSize:newSize];
    else
        return image;
}

+ (UIImage*)minimizeWithImage:(UIImage*)image mindetectingWith: (float)minWidhHeight
{
    if (image.size.width > minWidhHeight){ // 가로가 크면, 가로를최소에 고정, 세로를 맞춤
        float sizeHeight = image.size.height * minWidhHeight / image.size.width;
        CGSize newSize = CGSizeMake(minWidhHeight, sizeHeight);
        NSLog(@"newSize - W : %f, %f",newSize.width, newSize.height);
        
        image = [self sacleWithImage:image scaledToSize:newSize];
    }
    
    if (image.size.height > minWidhHeight){
        float sizeWidth = image.size.width * minWidhHeight / image.size.height;
        CGSize newSize = CGSizeMake(sizeWidth, minWidhHeight);
        NSLog(@"newSize - H : %f, %f",newSize.width, newSize.height);
        
        return [self sacleWithImage:image scaledToSize:newSize];
    }
    
    return image;
}

// 이미지 사이즈 줄이기
+ (UIImage*)sacleWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width+1,newSize.height+1)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

// 바운싱 애니메이션
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
    animation.removedOnCompletion   = YES; // final stage is equal to starting stage
    animation.autoreverses          = NO;
    
    return animation;
}

@end
