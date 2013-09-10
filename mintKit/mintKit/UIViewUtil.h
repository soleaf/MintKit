//
//  UIViewUtil.h
//  mintKit
//
//  Created by soleaf on 13. 9. 4..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 UIView Utility Is not organized any specific category class in UI Category.
 Therefore When Some functions group is collected, will make a class.
 */

@interface UIViewUtil : NSObject

/*
 Make UIView Appearance
*/

// Add Left Padding on UITextField
+ (void) addLeftpaddingToUITextField:(UITextField*) textField with:(float)width;

@end
