//
//  FormValidation.h
//  mintKit
//
//  Created by soleaf on 13. 2. 6..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
    Checking value is valid from.
 
 */

@interface FormValidation : NSObject

// Eamil format check. ex) abc@ab.com
+(BOOL) email:(NSString *)checkString;

// Limit text field length
/* ex)
    - (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string)
    {
        return [FromValidation limitLength:5 onTextField:textfiled inRange:range replaceString:string];
    }
*/
+(BOOL) limitLength:(NSInteger) limit onTextField:(UITextField *)textField inRange:(NSRange)range replaceString:(NSString *)string;

@end
