//
//  TimeSet.h
//  mintKit
//
//  Created by soleaf on 13. 8. 8..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeSet : NSObject
{
    NSTimeInterval interval;
    NSInteger hours;
    NSInteger minutes;
    NSInteger seconds;
}

@property NSTimeInterval interval;
@property NSInteger hours, minutes, seconds;

@end
