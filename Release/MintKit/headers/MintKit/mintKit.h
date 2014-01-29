//
//  mintKit.h
//  mintKit
//
//  Created by soleaf on 13. 9. 9..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 MINTCODE.ORG
 http://www.mintcode.org
 
 MintKit assist developing iOS App.
 
 This Project's reposigoty is https://github.com/soleaf/MintKit
 Welcome togther coding Anyone!
 
 How To Use and Other Detail Information is on README.md
 And More References on GitHub repository above.
 
 If You any question or Contact me?, Send mail to soleaf@gmail.com
 
 */

// Import Package
// without AddressUtil, MapUtil Because these need frameworks that not commonly used.
// !important: some classes(animationtuil... etc) need `QuartzCore` famework.

#import "ArrayUtil.h"
#import "DateUtil.h"
#import "ObjectUtil.h"
#import "StringUtil.h"
#import "FormatUtil.h"
#import "EncryptUtil.h"
#import "AnimationUtil.h"
#import "GraphicsUtil.h"
#import "FormValidation.h"
#import "UIRobot.h"
#import "UIViewControllerUtil.h"
#import "UIViewFrameUtil.h"
#import "UIViewLayerUtil.h"
#import "UIViewUtil.h"
#import "DeviceUtil.h"

@interface mintKit : NSObject

+ (void) hello;
+ (void) version;
+ (void) buildNumberCheck:(NSInteger) requestingBuildNumber;

@end