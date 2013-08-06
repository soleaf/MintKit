//
//  TestKit.h
//  travelogue
//
//  Created by flonelin on 13. 8. 1..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

// 설 명 : UnitTest & Debug를 편하게 하기 위해
// 주 의 : <# 주의사항설명 #>
// 사 용 : 여저기 저기 엉청 많이

#import <UIKit/UIKit.h>


@interface TestKit : NSObject


/*
 * 일반 디버깅
 *
 */

+ (void) debug:(NSString*) text;
+ (void) debugKey:(NSString*)key andVal:(NSObject*) value;
+ (void) checkIsUsedMethod: (const char[60]) methodName;


/*
 * 부가기능: 추후 분리고려
 *
 */

+ (void) alert:(NSString*)text;



/*
 * 메서드 경고, 및 알림
 *
 */

// SubClass에서 메서드를 구현하지 않음을 경고
+ (void) NotImplMthod: (const char[60]) methodName;
// SubClass에서 메서드를 구현하지 않음을 알림
+ (void) NotImplMthodNoti: (const char[60]) methodName;
// Deprecated 알림
+ (void) isDeprecated: (const char[60]) methodName moveTo:(NSString*) newMethodName;
// 사용않함 알림
+ (void) DontUse: (const char[60]) methodName;

@end
