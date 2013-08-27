//
//  UIVIewControllerUtil.h
//  mintKit
//
//  Created by soleaf on 13. 8. 1..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
    UIViewController's helper
    Make customed image back button in navigation bar,
    Simple Alert ...
 */

@interface UIVIewControllerUtil : NSObject

/*
 Navigation
 */

// Get a before controller in navigation viewcontrollers stack.
+ (UIViewController *)backViewController: (UIViewController *) view;


/*
 Customize UI
 */

// Show BackButtonIn UIViewNavigationBar With Custome Image
+ (void) showBackButton:(UIViewController *)view title: (NSString *) titleText andImageNamed: (NSString *) imgName;


/*
 Alert
 */

// Show UIAlert with contents text
+ (void) alertView:(NSString*)text;

@end
