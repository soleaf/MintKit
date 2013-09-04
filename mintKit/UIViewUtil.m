//
//  UIViewUtil.m
//  mintKit
//
//  Created by soleaf on 13. 9. 4..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "UIViewUtil.h"

@implementation UIViewUtil

+ (void)addLeftpaddingToUITextField:(UITextField *)textField with:(float)width
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, textField.frame.size.height)];
	textField.leftView = paddingView;
	textField.leftViewMode = UITextFieldViewModeAlways;

}

@end
