//
//  FormatUtil.h
//  mintKit
//
//  Created by soleaf on 13. 7. 18..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 Make String be foramtted like phone number.
 */

@interface FormatUtil : NSObject

/*
 
 Personal Information
 
 */

// Number to phone format: 12345678 -> 1234-5678 .. etc. (Korean type)
+ (NSString*) toPhoneNumberwithDash:(NSString *) value;

// Cut address to limit
// ex) cutAddress:@"aa bb cc" limit:2 -> return @"aa bb";
+ (NSString*) cutAddress:(NSString *)addressStr limit:(NSInteger) limit;

@end
