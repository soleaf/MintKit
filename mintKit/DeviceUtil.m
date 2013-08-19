//
//  DeviceUtil.m
//  mintKit
//
//  Created by soleaf on 13. 8. 19..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "DeviceUtil.h"

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

@end
