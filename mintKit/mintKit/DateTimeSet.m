//
//  TimeSet.m
//  mintKit
//
//  Created by soleaf on 13. 8. 8..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "DateTimeSet.h"

@implementation DateTimeSet
@synthesize interval,hours,minutes,seconds;
@synthesize year, month, day;

- (NSString *)description {
    
    // Existing date
    NSString *dateDesc = nil;
    if (year > 0 && month> 0 && day >0)
        dateDesc = [NSString stringWithFormat:@" Date(%d.%d.%d)",year, month,day ];
    else
        dateDesc = @"";
    
    return [NSString stringWithFormat:@"DateTimeSet: %@Time(%d:%d:%d) Interval(%f)", dateDesc, hours, minutes, seconds, interval];
}


@end
