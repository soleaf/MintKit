//
//  mintKit.m
//  mintKit
//
//  Created by soleaf on 13. 8. 6..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "mintKit.h"

#define MINTKIT_VERSION            @"0.0.1"
#define MINTKIT_VERSION_DATE       @"2013.08.08"

@implementation mintKit

+ (void) hello
{
    NSLog(@"HELLO MINTKIT!!!!");
    NSLog(@"SUCCESS MINTKIT INSTALLATION");
}

+ (void)version
{
    NSLog(@"MINTKIT_VERSION  %@(%@)",MINTKIT_VERSION, MINTKIT_VERSION_DATE);
}

@end
