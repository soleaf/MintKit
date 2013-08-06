//
//  UIRobot.m
//  travelogue
//
//  Created by flonelin on 13. 7. 26..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "UIRobot.h"

@implementation UIRobot

+ (void)putIfNotnillOrLength0:(NSString *)str toUI:(UIView *)target
{
    if ([target isKindOfClass:[UIButton class]])
        [UIRobot putIfNotnillOrLength0:str toButton     :(UIButton *)   target];
    
    else if ([target isKindOfClass:[UILabel class]])
        [UIRobot putIfNotnillOrLength0:str toLabel      :(UILabel *)    target];
    
    else if ([target isKindOfClass:[UITextField class]])
        [UIRobot putIfNotnillOrLength0:str toTextField  :(UITextField *) target];

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
