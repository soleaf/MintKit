//
//  mintKit.m
//  mintKit
//
//  Created by soleaf on 13. 8. 6..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "mintKit.h"

#define MINTKIT_VERSION            @"0.0.1"
#define MINTKIT_BUILD              4
#define MINTKIT_RELEASE            0
#define MINTKIT_VERSION_DATE       @"2013.09.04"

@implementation mintKit

+ (void)hello
{
    NSLog(@"HELLO MINTKIT!!!!");
    NSLog(@"SUCCESS MINTKIT INSTALLATION");
    NSLog(@"MINTCODE.ORG");
}

+ (void)version
{
    NSLog(@"MINTKIT_VERSION  %@ build %d(%@) release %d",
                                            MINTKIT_VERSION,
                                            MINTKIT_BUILD,
                                            MINTKIT_VERSION_DATE,
                                            MINTKIT_RELEASE);
}

@end
