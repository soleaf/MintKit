//
//  DeviceUtil.m
//  mintKit
//
//  Created by soleaf on 13. 8. 19..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//



#import "DeviceUtil.h"
#import <sys/utsname.h>

@implementation DeviceUtil

+ (BOOL) isRetina
{
    return  [[UIScreen mainScreen] scale] >= 2.0;
}

+ (BOOL) is4InchScreen
{
    return fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON;
}

+ (BOOL) isiPhone
{
    return [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone" ];
}

+ (NSString *)modelString
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}

+ (BOOL)isIOS7
{
    return ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7);
}

+ (BOOL)isIOSversionAbove:(float)version
{
    return ([[[UIDevice currentDevice] systemVersion] floatValue] >= version);
}

@end
