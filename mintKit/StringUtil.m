//
//  StringUtil.m
//  travelogue
//
//  Created by ilho Ahn on 2013. 6. 27..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "StringUtil.h"
#import "TestKit.h"

@implementation StringUtil


+ (NSString *) nvl:(NSString *)str
{
    if ([StringUtil hasLength:str]) return  str;
    else return  @"";
}

+ (NSString *)nvl:(NSString *)str nilStr:(NSString *)nilStr
{
    if ([StringUtil hasLength:str]) return  str;
    else return  nilStr;
}

+ (BOOL)isNilOrLength0:(NSString *)str // Deprecated.
{
    [TestKit methodisDeprecated:__func__ moveTo:@"hasLength:"];
    
    if (nil == str) return YES;
    
    NSString *trimed = [StringUtil trimed:str];
    if (trimed.length < 1)
        return YES;
    else
        return NO;
}

+ (BOOL)hasLength:(NSString *)str
{
    if (nil == str) return YES;
    
    NSString *trimed = [StringUtil trimed:str];
    if (trimed.length < 1)
        return NO;
    else
        return YES;
}

+ (NSString *)getNotNilOn:(NSString *)first and:(NSString *)second
{
    if ([StringUtil hasLength:first]) return first;
    else if ([StringUtil hasLength:second]) return second;
    else return nil;
}

+ (NSString *)getNotNilOn:(NSString *)first and:(NSString *)second and:(NSString *)third
{
    if ([StringUtil hasLength:first]) return first;
    else if ([StringUtil hasLength:second]) return second;
    else if ([StringUtil hasLength:third]) return third;
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

+ (NSString *) stringByStrippingHTML:(NSString*) htmlString
{
    NSRange range;
    while ((range = [htmlString rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        htmlString = [htmlString stringByReplacingCharactersInRange:range withString:@""];
    return htmlString;
}


+ (NSString *)trimed:(NSString *)str
{
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString*)uppercaseFirst:(NSString*)str
{
    return [str stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[str substringToIndex:1] uppercaseString]];
}

@end
