//
//  DeviceUtil.h
//  mintKit
//
//  Created by soleaf on 13. 8. 19..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
    Some Informations for device
    Checking Retina device, iPhone5...
 */

@interface DeviceUtil : NSObject

/*
 Screen
 */

// Is retina this device?
+ (BOOL) isRetina;

// Screen is 4Inch
+ (BOOL) is4InchScreen;


/*
 Device type
 */

// Is iPhone?
+ (BOOL) isiPhone;
+ (NSString*) modelString;


/*
 iOS version
*/
+ (BOOL) isIOS7;
+ (BOOL) isIOSversionAbove:(float)version;
@end
