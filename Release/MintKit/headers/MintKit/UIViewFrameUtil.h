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


/* 
 Moving UIView
 */

// Move to releative offset +/-
+(void) move:(UIView *) view moreY:(float) offset;
+(void) move:(UIView *) view moreX:(float) offset;
+(void) move:(UIView *) view morePoint:(CGPoint) point;

// Move to absolute offset
+(void) move:(UIView *) view toY:(float) offset;
+(void) move:(UIView *) view toX:(float) offset;
+(void) move:(UIView *) view toPoint:(CGPoint) point;


/*
 Resizing UIView
 */

// Resize one property or all.
+(void) size:(UIView *) view height:(float) height;
+(void) size:(UIView *) view width:(float) width;
+(void) size:(UIView *) view width:(float) width andHeight:(float)height;
// Resize one property or all. - Deprecated: Instead this incoreect methodname, Use 'size:...' method serise
+(void) frame:(UIView *) view height:(float) height;
+(void) frame:(UIView *) view width:(float) width;
+(void) frame:(UIView *) view w:(float) width andH:(float)height;

// Resize to relative size
+(void) size:(UIView *) view moreHeight:(float) height;
+(void) size:(UIView *) view moreWidth:(float) width;
+(void) size:(UIView *) view moreWidth:(float) width andMoreHeight:(float)height;
// Resize to relative size - Deprecated: Instead this incoreect methodname, Use 'size:...' method serise
+(void) frame:(UIView *) view moreH:(float) height;
+(void) frame:(UIView *) view moreW:(float) width;
+(void) frame:(UIView *) view moreW:(float) width andMoreH:(float)height;

/*
 Resizing UILabel by textsize
 */
+(CGSize) size:(UILabel*) label fitByTextConstrainedSize:(CGSize)contrainedSize;
// Deprecated: Instead this incoreect methodname, Use 'size:...' method serise
+(CGSize) frame:(UILabel*) label fitByTextConstrainedSize:(CGSize)contrainedSize;

@end
