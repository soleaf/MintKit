//
//  mintKit.m
//  mintKit
//
//  Created by soleaf on 13. 9. 9..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "mintKit.h"

#define MINTKIT_VERSION            @"0.0.3"
#define MINTKIT_BUILD              67
#define MINTKIT_RELEASE            1

@implementation mintKit

+ (void)hello
{
    NSLog(@"HELLO MINTKIT!!!!");
    NSLog(@"SUCCESS MINTKIT INSTALLATION");
    NSLog(@"MINTCODE.ORG");
}

+ (void)version
{
    NSLog(@"MINTKIT_VERSION  %@ build %d release %d",
          MINTKIT_VERSION,
          MINTKIT_BUILD,
          MINTKIT_RELEASE);
}

+ (void) buildNumberCheck:(NSInteger) requestingBuildNumber
{
    if (MINTKIT_BUILD != requestingBuildNumber){
        
        [NSException raise:@"Not Matched build number"
                    format:@"MINTKIT BUILD NUMBER CHECK WARNING: You reqeust checking build number :%d, But is not matched to %d",
         requestingBuildNumber,
         MINTKIT_BUILD];
    }
    else{
        NSLog(@"MINTKIT BUILD NUMBER CHECK SUCCESS -> %d", requestingBuildNumber);
    }
    
}

@end
