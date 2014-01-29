//
//  StringUtil.h
//  mintKit
//
//  Created by soleaf on 13. 6. 27..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
    NSString Utlities.
 */

@interface StringUtil : NSObject


/*
 
 Checking haslength, nvl
 
 */

// If A str is nil or length is 0, return "" else It.
+ (NSString *)nvl:(NSString*)str;

// If A str is nil or length is 0, return nilStr else It.
+ (NSString *)nvl:(NSString*)str nilStr:(NSString*)nilStr;

// Is nil or length 0?
+ (BOOL) isNilOrLength0:(NSString*) str;
+ (BOOL) hasLength: (NSString*)str;

// Return first String not nil and length 0 in Strings. If all strings is nil, return nil.
+ (NSString*)getNotNilOn:(NSString *) first and:(NSString*) second;
+ (NSString*)getNotNilOn:(NSString *) first and:(NSString*) second and:(NSString*) third;

// Return first String not nil and length 0 in Strings. If all strings is nil, return "".
+ (NSString*)getNotNilWithNVLOn:(NSString *) first and:(NSString*) second;
+ (NSString*)getNotNilWithNVLOn:(NSString *) first and:(NSString*) second and:(NSString*) third;



/*
 
 Transformations
 
 */

// Remove HTML tags.
+ (NSString *) stringByStrippingHTML:(NSString*) htmlString;

// Trim String
+ (NSString *)trimed:(NSString *)str;
+ (NSString*)trimLastSpace:(NSString*)str;

// Uppercase First string in sentence
+ (NSString*)uppercaseFirst:(NSString*)str;


/*
 
 Sizing
 : it auto detect iOS7/ iOS6.
 */
+ (CGSize) sizeOf:(NSString*)str systemFontOfSize:(float) fontSize;
+ (CGSize) sizeOf:(NSString*)str font:(UIFont*)font;
+ (CGSize) sizeOf:(NSString*)str font:(UIFont*)font bound:(CGSize) boundSize;
+ (CGSize) sizeOf:(NSString*)str font:(UIFont*)font bound:(CGSize) boundSize options:(NSStringDrawingOptions) options;

/* 
 
 ETC character split
 
 */

+ (NSMutableArray *)LinearHangul:(NSString *)string;
@end
