//
//  DateUtil.h
//  mintKit
//
//  Created by soleaf on 13. 8. 8..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeSet.h"

/*
 
    For easy using Date calculation.
 
 */

@interface DateUtil : NSObject

#define DATEDIC_YEAER @"year"
#define DATEDIC_MONTH @"month"
#define DATEDIC_DAY   @"day"

// NSDate -> NSDictionary
+ (NSDictionary *) NSDateToDateDic:(NSDate*) date;

// Get now date with NSdictionary
+ (NSDictionary *) getNowDate;

// Get next +/- offset date with NSDictionary
// ex) Getting tomorrow -> getNextDate: +1 ....
+ (NSDate *) getNextDate:(NSInteger) offset
                 AndYear:(NSInteger) theYear
                andMonth:(NSInteger) theMonth
                  andDay:(NSInteger) theDay;

// get next +/- offset date with dictionary
// ex) Getting tomorrow -> getNextDate: +1 ....
+ (NSDictionary *) getNextDateDicFromOffset:(NSInteger) offset
                                    AndYear:(NSInteger) theYear
                                   andMonth:(NSInteger) theMonth
                                     andDay:(NSInteger) theDay;

// NSInterval -> TimeSet(properties: interval, hours, minutes, seconds)
+ (TimeSet *) NSIntervalToTimeSet: (NSTimeInterval) interval;

@end
