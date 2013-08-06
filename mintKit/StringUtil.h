//
//  StringUtil.h
//  travelogue
//
//  Created by ilho Ahn on 2013. 6. 27..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StringUtil : NSObject

+ (NSString *) stringByStrippingHTML:(NSString*)s;
+ (void) setTextFieldWithNotNilandSpace:(NSString *) str andTextField:(UITextField *)textField;
+ (NSString *)trimed:(NSString *)str;
+ (NSString *)nvl:(NSString*)str;
+ (NSString *)nvl:(NSString*)str nilStr:(NSString*)nilStr;
+ (BOOL) isNilOrLength0:(NSString*) str;

+ (NSString*)getNotNilOn:(NSString *) first and:(NSString*) second;
+ (NSString*)getNotNilOn:(NSString *) first and:(NSString*) second and:(NSString*) third;
+ (NSString*)getNotNilWithNVLOn:(NSString *) first and:(NSString*) second;
+ (NSString*)getNotNilWithNVLOn:(NSString *) first and:(NSString*) second and:(NSString*) third;

@end
