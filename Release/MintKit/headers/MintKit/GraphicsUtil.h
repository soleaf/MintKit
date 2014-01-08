//
//  GraphicsUtil.h
//  mintKit
//
//  Created by soleaf on 13. 1. 11..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
    Handling like reszing image.
 */

@interface GraphicsUtil : NSObject

/*
    Resize image
*/

// Resize Image to newSize If image size is saller than minSize
+ (UIImage*)minimizeWithImage:(UIImage*)image scaledToSize:(CGSize)newSize mindetectingSize: (CGSize)minSize;

// Resize Image to minWith If image size is saller than minSize
+ (UIImage*)minimizeWithImage:(UIImage*)image minWithHeight: (float)min;

// Rsize Image to newSize
+ (UIImage*)resizeWithImage:(UIImage*)image toSize:(CGSize)newSize;

// Image Tint
+ (UIImage*)image:(UIImage*)image withTint:(UIColor*)tintColor;

/*
 Color
 */

// Hexcode to UIColor
+ (UIColor*)uiColorWithHexString:hexString;

@end
