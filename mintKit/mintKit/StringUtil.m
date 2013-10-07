//
//  StringUtil.m
//  travelogue
//
//  Created by ilho Ahn on 2013. 6. 27..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "StringUtil.h"
#import "TestKit.h"
#import "DeviceUtil.h"

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
    if (nil == str) return YES;
    
    NSString *trimed = [StringUtil trimed:str];
    if (trimed.length < 1)
        return YES;
    else
        return NO;
}

+ (BOOL)hasLength:(NSString *)str
{
    if (nil == str) return NO;
    
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


+ (CGSize)sizeOf:(NSString *)str systemFontOfSize:(float)fontSize
{
    if ([DeviceUtil isIOS7]){
        return [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    }
    else{
        return [str sizeWithFont:[UIFont systemFontOfSize:fontSize]];
    }
}

+ (CGSize)sizeOf:(NSString *)str font:(UIFont *)font
{
     if ([DeviceUtil isIOS7]){
         return [str sizeWithAttributes:@{NSFontAttributeName:font}];
     }
     else{
         return [str sizeWithFont:font];
     }
}

+(CGSize)sizeOf:(NSString *)str font:(UIFont *)font bound:(CGSize)boundSize
{
    if ([DeviceUtil isIOS7]){
        return [self sizeOf:str font:font bound:boundSize options:NSStringDrawingUsesLineFragmentOrigin];
    }
    else{
        return [str sizeWithFont:font constrainedToSize:boundSize lineBreakMode:NSLineBreakByCharWrapping];
    }
}

+(CGSize)sizeOf:(NSString *)str font:(UIFont *)font bound:(CGSize)boundSize options:(NSStringDrawingOptions)options
{
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:str
                                                                         attributes:@{NSFontAttributeName: font}];
    CGRect rect = [attributedText boundingRectWithSize:boundSize
                                               options:options
                                               context:nil];
    return rect.size;

}
+ (NSMutableArray *)LinearHangul:(NSString *)string
{
    
    // This Code scrapped from
    // http://nicejinux.net/bbs/zboard.php?id=lecture&page=1&sn1=&divpage=1&category=5&sn=off&ss=on&sc=on&select_arrange=headnum&desc=asc&no=206&PHPSESSID=a47abd937cd1c885493f55f7c5f2387f
    
    NSArray *chosung = [NSArray arrayWithObjects:@"ㄱ",@"ㄲ",@"ㄴ",@"ㄷ",@"ㄸ",@"ㄹ",@"ㅁ",@"ㅂ",@"ㅃ",@"ㅅ",@"ㅆ",@"ㅇ",@"ㅈ",@"ㅉ",@"ㅊ",@"ㅋ",@"ㅌ",@"ㅍ",@"ㅎ",nil];
    NSArray *jungsung = [NSArray arrayWithObjects:@"ㅏ",@"ㅐ",@"ㅑ",@"ㅒ",@"ㅓ",@"ㅔ",@"ㅕ",@"ㅖ",@"ㅗ",@"ㅘ",@"ㅙ",@"ㅚ",@"ㅛ",@"ㅜ",@"ㅝ",@"ㅞ",@"ㅟ",@"ㅠ",@"ㅡ",@"ㅢ",@"ㅣ",nil];
    NSArray *jongsung = [NSArray arrayWithObjects:@"",@"ㄱ",@"ㄲ",@"ㄳ",@"ㄴ",@"ㄵ",@"ㄶ",@"ㄷ",@"ㄹ",@"ㄺ",@"ㄻ",@"ㄼ",@"ㄽ",@"ㄾ",@"ㄿ",@"ㅀ",@"ㅁ",@"ㅂ",@"ㅄ",@"ㅅ",@"ㅆ",@"ㅇ",@"ㅈ",@"ㅊ",@"ㅋ",@" ㅌ",@"ㅍ",@"ㅎ",nil];
    NSMutableArray *resultList = [NSMutableArray arrayWithCapacity:0];
    
    for (int i=0;i<[string length];i++) {
        int code = [string characterAtIndex:i];
        if (code >= 44032 && code <= 55203) {
            int unicode = code - 44032;
            int chosungIdx  = unicode / 21 / 28;
            int jungsungIdx = unicode % (21 * 28) / 28;
            int jongsungIdx = unicode % 28;
            NSArray *result = [NSArray arrayWithObjects:[chosung objectAtIndex:chosungIdx], [jungsung objectAtIndex:jungsungIdx], [jongsung objectAtIndex:jongsungIdx], nil];
            [resultList addObject:result];
        }
    }
    return resultList;
}
@end
