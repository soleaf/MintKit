//
//  ObjectUtil.h
//  travelogue
//
//  Created by flonelin on 13. 7. 30..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

// 설 명 : 기타 NSObject관련처리
// 주 의 : 나중에 쪼갤 수 있으면 쪼개기
// 사 용 : <# 어디에 사용되는지 사용장소 #>


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ObjectUtil : NSObject


// 비교연산
+ (BOOL) CGPoint:(CGPoint) point isEqual:(CGPoint) diffPoint;

@end
