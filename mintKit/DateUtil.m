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
    NSInteger day = [components day];
    NSInteger month = [components month];
    NSInteger year = [components year];
    
    return [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInteger:day ], @"day", [NSNumber numberWithInteger:month ], @"month", [NSNumber numberWithInteger:year ],@"year", nil];
}


+ (NSDictionary *)getNowDate
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    NSInteger day = [components day];
    NSInteger month = [components month];
    NSInteger year = [components year];
    
    return [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInteger:day ], @"day", [NSNumber numberWithInteger:month ], @"month", [NSNumber numberWithInteger:year ],@"year", nil];
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

+ (TimeSet *) NSIntervalToTimeSet: (NSTimeInterval) interval
{
    int nowCount = interval;
    
    NSInteger hours = nowCount/ 60/ 60;
    nowCount =  nowCount % (60 * 60);
    
    NSInteger minutes = nowCount / 60;
    nowCount = nowCount % 60;
    
    NSInteger seconds = nowCount;
    
    TimeSet *timeSet = [[TimeSet alloc] init];
    timeSet.interval = interval;
    timeSet.hours = hours;
    timeSet.minutes = minutes;
    timeSet.seconds = seconds;
    
    return timeSet;
}
@end
