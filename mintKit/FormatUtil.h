//
//  FormatUtil.h
//  travelogue
//
//  Created by flonelin on 13. 7. 18..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormatUtil : NSObject

// 전화번호 dsah(-)를 넣어서 반환
+ (NSString*) toPhoneNumberwithDash:(NSString *) value;

// 주소를 앞 limit번째까지만 반환
// 예) limit(3) 서울시 관악구 봉천동 12323-323 -> 서울시 관악구 봉천동 반환
+ (NSString*) cutAddress:(NSString *)addressStr limit:(NSInteger) limit;

@end
