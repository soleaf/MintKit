//
//  FormValidation.h
//  mintKit
//
//  Created by soleaf on 13. 2. 6..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//


#import <Foundation/Foundation.h>

/*
    Checking value is valid from.
 
 */

@interface FormValidation : NSObject

// Eamil format check. ex) abc@ab.com
+(BOOL) email:(NSString *)checkString;

@end
