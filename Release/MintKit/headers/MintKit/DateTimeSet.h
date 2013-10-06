//
//  TimeSet.h
//  mintKit
//
//  Created by soleaf on 13. 8. 8..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 Model Object For Date and time.
 
 */

@interface DateTimeSet : NSObject
{
    NSTimeInterval  interval;
    
    NSInteger       hours;
    NSInteger       minutes;
    NSInteger       seconds;
    
    NSInteger       year;
    NSInteger       month;
    NSInteger       day;
}

@property NSTimeInterval interval;
@property NSInteger hours, minutes, seconds;
@property NSInteger year, month, day;

- (NSString *)description;
+ (DateTimeSet*)makeDateTimeSetYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end
