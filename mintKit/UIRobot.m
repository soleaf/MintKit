//
//  UIRobot.m
//  mintKit
//
//  Created by soleaf on 13. 7. 26..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "UIRobot.h"
#import "TestKit.h"

@implementation UIRobot

+ (void)putIfNotnillOrLength0:(NSString *)str toUI:(UIView *)target
{
    if ([target isKindOfClass:[UIButton class]])
        [UIRobot putIfNotnillOrLength0:str toButton     :(UIButton *)   target];
    
    else if ([target isKindOfClass:[UILabel class]])
        [UIRobot putIfNotnillOrLength0:str toLabel      :(UILabel *)    target];
    
    else if ([target isKindOfClass:[UITextField class]])
        [UIRobot putIfNotnillOrLength0:str toTextField  :(UITextField *) target];
    
    else
        [TestKit errorRuntime:__func__ code:@"UIRobot putIfNotnillOrLength0: toUI:" reason:@"Not found matched Class"];
}

+ (void) putIfNotnillOrLength0:(NSString *)str toTextField:(UITextField*) target
{
    if (![StringUtil isNilOrLength0:str]) target.text = str;
}

+ (void) putIfNotnillOrLength0:(NSString *)str toButton:(UIButton*) target
{
    if (![StringUtil isNilOrLength0:str]) [target setTitle:str forState:UIControlStateNormal];
}

+ (void) putIfNotnillOrLength0:(NSString *)str toLabel:(UILabel*) target
{
    if (![StringUtil isNilOrLength0:str]) target.text = str;
}



@end
