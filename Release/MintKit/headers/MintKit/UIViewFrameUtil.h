//
//  UIViewFrameUtil.h
//  mintKit
//
//  Created by soleaf on 13. 7. 18..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 
 UIViewFrameUtil make coding to modify UIView frame very easy.
 
 */

@interface UIViewFrameUtil : NSObject

// Move to releative offset +/-
+(void) move:(UIView *) view moreY:(float) offset;
+(void) move:(UIView *) view moreX:(float) offset;

// Move to absolute offset
+(void) move:(UIView *) view toY:(float) offset;
+(void) move:(UIView *) view toX:(float) offset;

// Resize one property or all.
+(void) frame:(UIView *) view height:(float) height;
+(void) frame:(UIView *) view width:(float) width;
+(void) frame:(UIView *) view w:(float) width andH:(float)height;

// Resize to reslative size
+(void) frame:(UIView *) view moreH:(float) height;
+(void) frame:(UIView *) view moreW:(float) width;
+(void) frame:(UIView *) view moreW:(float) width andMoreH:(float)height;

@end
