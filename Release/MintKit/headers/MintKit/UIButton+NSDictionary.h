//
//  UIButton+NSDictionary.h
//  mintKit
//
//  Created by soleaf on 13. 9. 2..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 
 UIButton category NSDictionary
 It's add NSDictionary property to UIButton.
 You can use UIButton instance with NSDictionary infoDictionary.
 
 // Example
 UIButtion *myButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,30,30)];
 myButon.infoDictionary = myDic;
 
 */

@interface UIButton(NSDIctionary)

@property NSDictionary *infoDictionary;

@end
