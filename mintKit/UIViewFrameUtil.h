//
//  UIViewFrameUtil.h
//  travelogue
//
//  Created by flonelin on 13. 7. 18..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewFrameUtil : NSObject

// +/- 어디로 이동(상대)
+(void) move:(UIView *) view moreY:(float) offset;
+(void) move:(UIView *) view moreX:(float) offset;

// x까지 이동(절대)
+(void) move:(UIView *) view toY:(float) offset;
+(void) move:(UIView *) view toX:(float) offset;

// 사이즈
+(void) frame:(UIView *) view height:(float) height;
+(void) frame:(UIView *) view width:(float) width;
+(void) frame:(UIView *) view w:(float) width andH:(float)height;

+(void) frame:(UIView *) view moreH:(float) height;

@end
