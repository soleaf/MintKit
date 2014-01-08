//
//  GraphicsUtil.ㅡ
//  mintKit
//
//  Created by soleaf on 13. 1. 11..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>

#import "GraphicsUtil.h"
#import "TestKit.h"

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

+ (UIImage *)image:(UIImage *)baseImage withTint:(UIColor *)tintColor
{
    
    // Scraped from http://stackoverflow.com/a/11258530
    // Thank you!
    
    UIGraphicsBeginImageContext(baseImage.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, baseImage.size.width, baseImage.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSaveGState(ctx);
    CGContextClipToMask(ctx, area, baseImage.CGImage);
    [tintColor set];
    CGContextFillRect(ctx, area);
    CGContextRestoreGState(ctx);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextDrawImage(ctx, area, baseImage.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIColor*)uiColorWithHexString:hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    
    if ([hexString rangeOfString:@"#"].location == !NSNotFound){
        [scanner setScanLocation:1]; // bypass '#' character
    }
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0
                           green:((rgbValue & 0xFF00) >> 8)/255.0
                            blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


@end
