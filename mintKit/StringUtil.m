//
//  StringUtil.m
//  travelogue
//
//  Created by ilho Ahn on 2013. 6. 27..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "StringUtil.h"

@implementation StringUtil


+ (NSString *) stringByStrippingHTML:(NSString*) htmlString
{
    NSRange range;
    while ((range = [htmlString rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        htmlString = [htmlString stringByReplacingCharactersInRange:range withString:@""];
    return htmlString;
}

// Trim
+ (NSString *)trimed:(NSString *)str
{
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *) nvl:(NSString *)str
{
    if ([StringUtil isNilOrLength0:str]) return  @"";
    else return  str;
}

+ (NSString *)nvl:(NSString *)str nilStr:(NSString *)nilStr
{
    if ([StringUtil isNilOrLength0:str]) return  nilStr;
    else return  str;
}

// nil이거나 길이가 0인지검사(공백제거 )
+ (BOOL)isNilOrLength0:(NSString *)str
{
    if (nil == str) return YES;
    
    NSString *trimed = [StringUtil trimed:str];
    if (trimed.length < 1)
        return YES;
    else
        return NO;
}


// nil이 아닌 첫번째 값을 취함
+ (NSString *)getNotNilOn:(NSString *)first and:(NSString *)second
{
    if (![StringUtil isNilOrLength0:first]) return first;
    else if (![StringUtil isNilOrLength0:second]) return second;
    else return nil;
}

+ (NSString *)getNotNilOn:(NSString *)first and:(NSString *)second and:(NSString *)third
{
    if (![StringUtil isNilOrLength0:first]) return first;
    else if (![StringUtil isNilOrLength0:second]) return second;
    else if (![StringUtil isNilOrLength0:third]) return third;
    else return nil;
}

+ (NSString *)getNotNilWithNVLOn:(NSString *)first and:(NSString *)second
{
    NSString *checked = [StringUtil getNotNilOn:first and:second];
    if (checked)
        return checked;
    else
        return @"";
}

+ (NSString *)getNotNilWithNVLOn:(NSString *)first and:(NSString *)second and:(NSString *)third
{
    NSString *checked = [StringUtil getNotNilOn:first and:second and:third];
    if (checked)
        return checked;
    else
        return @"";
}

@end
