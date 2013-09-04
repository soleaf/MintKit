//
//  DateUtil.h
//  mintKit
//
//  Created by soleaf on 13. 8. 8..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DateTimeSet.h"

/*
 
    For easy using Date calculation.
 
 */

@interface DateUtil : NSObject

#define DATEDIC_YEAR @"year"
#define DATEDIC_MONTH @"month"
#define DATEDIC_DAY   @"day"

/*
    Convert NSDate, NSDictionary, DateTimeSet
 */

// NSDate -> NSDictionary
+ (NSDictionary *) NSDateToDateDic:(NSDate*) date;

// NSDate -> DateTimeSet
+ (DateTimeSet *)  NSDateToDateTimeSet:(NSDate*) date;

// NSInterval -> DateTimeSet(properties: interval, hours, minutes, seconds)
+ (DateTimeSet *) NSIntervalToTimeSet: (NSTimeInterval) interval;


/*
    Get Date nad Calculation before, after date
 
 */

// Get now date with NSdictionary
+ (NSDictionary *) getNowDate;

// Get now date with DateTimeSet
+ (DateTimeSet *)  getNowDateTimeSet;

// Get next +/- offset date with NSDate
// ex) Getting tomorrow -> getNextDate: +1 ....
+ (NSDate *) getNextDate:(NSInteger) offset
                 AndYear:(NSInteger) theYear
                andMonth:(NSInteger) theMonth
                  andDay:(NSInteger) theDay;

// Get next +/- offset date with NSDictionary
// ex) Getting tomorrow -> getNextDate: +1 ....
+ (NSDictionary *) getNextDateDicFromOffset:(NSInteger) offset
                                    AndYear:(NSInteger) theYear
                                   andMonth:(NSInteger) theMonth
                                     andDay:(NSInteger) theDay;


// Get next +/- offset date with DateTimeSet
// ex) Getting tomorrow -> getNextDate: +1 ....
+ (DateTimeSet *) getNextDateSetFromOffset:(NSInteger) offset
                                    AndYear:(NSInteger) theYear
                                   andMonth:(NSInteger) theMonth
                                     andDay:(NSInteger) theDay;


@end
