//
//  UIViewLayerUtil.h
//  travelogue
//
//  Created by flonelin on 13. 7. 29..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewLayerUtil : NSObject


// 그림자 뿌리기
+ (void) dropShadow:(UIView *) view Opacity:(float)opacity andOffset:(CGSize) offset andColor:(UIColor*) color;
+ (void) dropShadow:(UIView *) view Opacity:(float)opacity andOffset:(CGSize) offset;

// 그라디언트
+ (void) gradient:(UIView *) view start:(UIColor *)startColor endColor:(UIColor*) endColor;

@end
