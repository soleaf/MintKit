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


- (BOOL)isEqualToDateTimes:(DateTimeSet *)target
{
    if ([self isEqualToDate:target] && [self isEqualToTime:target])
        return YES;
    else
        return NO;
}

- (BOOL)isEqualToDate:(DateTimeSet *)target
{
    if (self.year   != target.year) return NO;
    if (self.month  != target.month) return NO;
    if (self.day    != target.day) return NO;
    
    return YES;
}

-(BOOL)isEqualToTime:(DateTimeSet *)target
{
    if (self.hours  != target.hours) return NO;
    if (self.minutes != target.minutes) return NO;
    if (self.seconds != target.seconds) return NO;
    
    return YES;
}

+ (DateTimeSet *)makeDateTimeSetYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    DateTimeSet *dateTimeSet = [[DateTimeSet alloc] init];
    dateTimeSet.year    = year;
    dateTimeSet.month   = month;
    dateTimeSet.day     = day;
    
    return dateTimeSet;
}

+ (DateTimeSet *)makeDateTimeSetHour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second
{
    DateTimeSet *dateTimeSet = [[DateTimeSet alloc] init];
    dateTimeSet.hours   = hour;
    dateTimeSet.minutes = minute;
    dateTimeSet.seconds = second;
    
    return dateTimeSet;
}

+ (DateTimeSet *)makeDateTimeSetYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second
{
    DateTimeSet *dateTimeSet = [[DateTimeSet alloc] init];
    dateTimeSet.year    = year;
    dateTimeSet.month   = month;
    dateTimeSet.day     = day;
    dateTimeSet.hours   = hour;
    dateTimeSet.minutes = minute;
    dateTimeSet.seconds = second;
    
    return dateTimeSet;}

@end
