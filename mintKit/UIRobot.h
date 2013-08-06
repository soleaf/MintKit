//
//  UIRobot.h
//  travelogue
//
//  Created by flonelin on 13. 7. 26..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//


// 설 명 : UI관련 자동화
// 주 의 : <# 주의사항설명 #>
// 사 용 : <# 어디에 사용되는지 사용장소 #>


#import <Foundation/Foundation.h>
#import "StringUtil.h"

@interface UIRobot : NSObject

// nil 이나 length ==0이 아닐때, 각 UI 객체들의 텍스트값을 채우기
+ (void) putIfNotnillOrLength0:(NSString *)str toUI:(UIView*) target;
+ (void) putIfNotnillOrLength0:(NSString *)str toTextField:(UITextField*) target;
+ (void) putIfNotnillOrLength0:(NSString *)str toButton:(UIButton*) target;
+ (void) putIfNotnillOrLength0:(NSString *)str toLabel:(UILabel*) target;

@end
