//
//  TestDateUtil.m
//  mintKit
//
//  Created by soleaf on 13. 10. 10..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "TestDateUtil.h"
#import "DateUtil.h"

@implementation TestDateUtil

- (void) testNextDays1
{
    NSDate *date = [DateUtil makeNSDateYear:2013 andMonth:1 andDay:4];
    DateTimeSet *dateTimeSet = [DateUtil NSDateToDateTimeSet:date];
    
    // next +1
    DateTimeSet *next1day = [DateUtil getNextDateSetFromOffset:+1
                                                       AndYear:dateTimeSet.year
                                                      andMonth:dateTimeSet.month
                                                        andDay:dateTimeSet.day];
    
    STAssertEquals(next1day.year, 2013, @"year -> 2013");
    STAssertEquals(next1day.month,   1, @"month -> 1");
    STAssertEquals(next1day.day,     5, @"day -> 5");

}

- (void) testNextDays2
{
    NSDate *date = [DateUtil makeNSDateYear:2013 andMonth:1 andDay:31];
    DateTimeSet *dateTimeSet = [DateUtil NSDateToDateTimeSet:date];
    
    // next +1
    DateTimeSet *next1day = [DateUtil getNextDateSetFromOffset:+1
                                                       AndYear:dateTimeSet.year
                                                      andMonth:dateTimeSet.month
                                                        andDay:dateTimeSet.day];
    
    STAssertEquals(next1day.year, 2013, @"year -> 2013");
    STAssertEquals(next1day.month,   2, @"month -> 2");
    STAssertEquals(next1day.day,     1, @"day -> 1");
    
}

- (void) testNextDays3
{
    NSInteger month = 2;
    NSInteger day = 27;
    
    NSDate *date = [DateUtil makeNSDateYear:2013 andMonth:month andDay:day];
    DateTimeSet *dateTimeSet = [DateUtil NSDateToDateTimeSet:date];
    
    NSInteger lastDay   = [DateUtil getLastDayOfMonth:date];
    NSInteger nextDay   = (day == lastDay ? 1: day+1);
    NSInteger nextMonth = (day == lastDay ? month+1: month);
    
    // next +1
    DateTimeSet *next1day = [DateUtil getNextDateSetFromOffset:+1
                                                       AndYear:dateTimeSet.year
                                                      andMonth:dateTimeSet.month
                                                        andDay:dateTimeSet.day];
    
    STAssertEquals(next1day.year, 2013, @"year -> 2013");
    STAssertEquals(next1day.month, nextMonth, @"month -> nextMonth");
    STAssertEquals(next1day.day, nextDay, @"day -> nextDay");
    
}

- (void) testNextDays4
{
    NSInteger month = 3;
    NSInteger day = 1;
    
    NSDate *date = [DateUtil makeNSDateYear:2013 andMonth:month andDay:day];
    DateTimeSet *dateTimeSet = [DateUtil NSDateToDateTimeSet:date];
    
    NSInteger lastDay   = [DateUtil getLastDayOfMonth:[DateUtil makeNSDateYear:2013 andMonth:month-1 andDay:day]];
    NSInteger nextDay   = (day == 1 ? lastDay: day-1);
    NSInteger nextMonth = (day == 1 ? month-1: month);
    
    // next +1
    DateTimeSet *next1day = [DateUtil getNextDateSetFromOffset:-1
                                                       AndYear:dateTimeSet.year
                                                      andMonth:dateTimeSet.month
                                                        andDay:dateTimeSet.day];
    
    STAssertEquals(next1day.year, 2013, @"year -> 2013");
    STAssertEquals(next1day.month, nextMonth, @"month -> nextMonth");
    STAssertEquals(next1day.day, nextDay, @"day -> nextDay");
    
}

- (void) testNextDays5
{
    NSDate *date = [DateUtil makeNSDateYear:2013 andMonth:1 andDay:31];
    DateTimeSet *dateTimeSet = [DateUtil NSDateToDateTimeSet:date];
    
    // next +1
    DateTimeSet *next1day = [DateUtil getNextDateSetFromOffset:-1
                                                       AndYear:dateTimeSet.year
                                                      andMonth:dateTimeSet.month
                                                        andDay:dateTimeSet.day];
    
    STAssertEquals(next1day.year, 2013, @"year -> 2013");
    STAssertEquals(next1day.month,   1, @"month -> 1");
    STAssertEquals(next1day.day,    30, @"day -> 30");
    
}

- (void) testNextDays6
{
    NSDate *date = [DateUtil makeNSDateYear:2013 andMonth:1 andDay:31];
    DateTimeSet *dateTimeSet = [DateUtil NSDateToDateTimeSet:date];
    
    // next +1
    DateTimeSet *next1day = [DateUtil getNextDateSetFromOffset:-8
                                                       AndYear:dateTimeSet.year
                                                      andMonth:dateTimeSet.month
                                                        andDay:dateTimeSet.day];
    
    STAssertEquals(next1day.year, 2013, @"year -> 2013");
    STAssertEquals(next1day.month,   1, @"month -> 1");
    STAssertEquals(next1day.day,    23, @"day -> 30");
    
}

- (void) testMakeNSDate1
{
    
    NSDate *date = [DateUtil makeNSDateYear:2013 andMonth:1 andDay:4];
    DateTimeSet *dateTimeSet = [DateUtil NSDateToDateTimeSet:date];

    STAssertEquals(dateTimeSet.year, 2013, @"year -> 2013");
    STAssertEquals(dateTimeSet.month,   1, @"month -> 1");
    STAssertEquals(dateTimeSet.day,     4, @"day -> 4");
    
}

- (void) testMakeNSDate2
{
    NSDate *date = [DateUtil makeNSDateYear:2013 andMonth:10 andDay:8];
    DateTimeSet *dateTimeSet = [DateUtil NSDateToDateTimeSet:date];
    
    STAssertEquals(dateTimeSet.year, 2013, @"year -> 2013");
    STAssertEquals(dateTimeSet.month,  10, @"month -> 10");
    STAssertEquals(dateTimeSet.day,     8, @"day -> 8");
}

- (void) testGetLastDays
{
    // Test Case: 2013 months

    NSMutableArray *lastDaysTest = [[NSMutableArray alloc] init];
    NSArray *lastDaysCorrect = @[@31, @28, @31, @30, @31,
                                @30, @31, @31, @30, @31,
                                @30, @31];
    
    for (NSInteger month = 1; month <= 12 ; month++){
        NSDate *date = [DateUtil makeNSDateYear:2013 andMonth:month andDay:1];
        NSInteger lastDay   = [DateUtil getLastDayOfMonth:date];
        
        [lastDaysTest addObject:[NSNumber numberWithInteger:lastDay]];
    }
    
    for (NSInteger i=0; i < 12; i++){
        
        STAssertEquals([[lastDaysCorrect objectAtIndex:i] integerValue] ,
                       [[lastDaysTest objectAtIndex:i] integerValue],
                       @"Incorrect last day");
        
    }
}

@end
