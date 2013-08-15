//
//  DateUtil.m
//  mintKit
//
//  Created by soleaf on 13. 8. 8..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil

// TODO: Make DateSet Object and change NSDictionary returning to DateSet

+ (NSDictionary *) NSDateToDateDic:(NSDate*) date
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    NSInteger day   = [components day];
    NSInteger month = [components month];
    NSInteger year  = [components year];
    NSInteger hour  = [components hour];
    NSInteger min   = [components minute];
    NSInteger sec   = [components second];
    
    return [[NSDictionary alloc] initWithObjectsAndKeys:
            [NSNumber numberWithInteger:day], @"day",
            [NSNumber numberWithInteger:month], @"month",
            [NSNumber numberWithInteger:year],@"year",
            [NSNumber numberWithInteger:hour],@"hour",
            [NSNumber numberWithInteger:min],@"minute",
            [NSNumber numberWithInteger:sec],@"second",
            nil];
}

+ (DateTimeSet *) NSDateToDateTimeSet:(NSDate *)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];

    DateTimeSet *dateTimeSet = [[DateTimeSet alloc] init];
    dateTimeSet.year    = [components year];
    dateTimeSet.month   = [components month];
    dateTimeSet.day     = [components day];
    dateTimeSet.hours   = [components hour];
    dateTimeSet.minutes = [components minute];
    dateTimeSet.seconds = [components second];
    
    return dateTimeSet;
}

+ (NSDictionary *)getNowDate
{
    return [DateUtil NSDateToDateDic:[NSDate date]];
}

+ (DateTimeSet *)getNowDateTimeSet
{
    return [DateUtil NSDateToDateTimeSet:[NSDate date]];
}

+ (NSDate *)getNextDate:(NSInteger) offset AndYear:(NSInteger) theYear andMonth:(NSInteger) theMonth andDay:(NSInteger) theDay
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:theDay];
    [components setMonth:theMonth];
    [components setYear:theYear];
    NSDate *thisDate = [gregorian dateFromComponents:components];

    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:offset];
    NSDate *nextDate = [gregorian dateByAddingComponents:offsetComponents toDate:thisDate options:0];
    
    return nextDate;
}

+ (NSDictionary *)getNextDateDicFromOffset:(NSInteger)offset AndYear:(NSInteger)theYear andMonth:(NSInteger)theMonth andDay:(NSInteger)theDay
{
    NSDate *nextDate = [DateUtil getNextDate:offset AndYear:theYear andMonth:theMonth andDay:theDay];
    return [DateUtil NSDateToDateDic:nextDate];
}

+ (DateTimeSet *) NSIntervalToTimeSet: (NSTimeInterval) interval
{
    int nowCount = interval;
    
    NSInteger hours = nowCount/ 60/ 60;
    nowCount =  nowCount % (60 * 60);
    
    NSInteger minutes = nowCount / 60;
    nowCount = nowCount % 60;
    
    NSInteger seconds = nowCount;
    
    DateTimeSet *dateTimeSet = [[DateTimeSet alloc] init];
    dateTimeSet.interval = interval;
    dateTimeSet.hours    = hours;
    dateTimeSet.minutes  = minutes;
    dateTimeSet.seconds  = seconds;
    
    return dateTimeSet;
}
@end
