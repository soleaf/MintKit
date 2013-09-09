//
//  MintKitUnitTest.h
//  MintKitUnitTest
//
//  Created by soleaf on 13. 9. 9..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MintKit/StringUtil.h>

#import "AppDelegate.h"
#import "MainViewController.h"

@interface MintKitUnitTest : SenTestCase
{
    @private
    AppDelegate         *appDelegate;
    MainViewController  *mainViewCtr;
    UIButton            *animatingButton;
}

@end
