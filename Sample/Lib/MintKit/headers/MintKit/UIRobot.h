//
//  UIRobot.h
//  mintKit
//
//  Created by soleaf on 13. 7. 26..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringUtil.h"

/*

 Automatic UI configurations.
 Example. SetText on UITextField, If text is not nil.
 
 */

@interface UIRobot : NSObject

// setText or setTitle, If str is not nil and not length0
+ (void) putIfNotnillOrLength0:(NSString *)str toUI:(UIView*) target;
+ (void) putIfNotnillOrLength0:(NSString *)str toTextField:(UITextField*) target;
+ (void) putIfNotnillOrLength0:(NSString *)str toButton:(UIButton*) target;
+ (void) putIfNotnillOrLength0:(NSString *)str toLabel:(UILabel*) target;

@end
