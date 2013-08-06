//
//  FormatUtil.m
//  travelogue
//
//  Created by flonelin on 13. 7. 18..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "FormatUtil.h"
#import "StringUtil.h"

@implementation FormatUtil


+ (NSString*) toPhoneNumberwithDash:(NSString *) value
{
    NSString *rvalue = value == nil ? @"" : [[StringUtil trimed:value] stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    // 9자
    // 00-000-0000
    if(rvalue.length == 9) {
        return [NSString stringWithFormat:@"%@-%@-%@",
                                            [rvalue substringWithRange:NSMakeRange(0, 2)],
                                            [rvalue substringWithRange:NSMakeRange(2, 3)],
                                            [rvalue substringWithRange:NSMakeRange(5, 4)]
                ];
    }
    // 8자
    // 0000-0000
    else if(rvalue.length == 8) {
        
        return [NSString stringWithFormat:@"%@-%@",
                [rvalue substringWithRange:NSMakeRange(0, 4)],
                [rvalue substringWithRange:NSMakeRange(3, 4)]
                ];
        
    }
    // 10자
    else if(rvalue.length == 10) {
        
        // 02로 시작시
        // 02-0000-0000
        if ([@"02" isEqualToString:[rvalue substringWithRange:NSMakeRange(0, 2)]])
            return [NSString stringWithFormat:@"%@-%@-%@",
                    [rvalue substringWithRange:NSMakeRange(0, 2)],
                    [rvalue substringWithRange:NSMakeRange(2, 4)],
                    [rvalue substringWithRange:NSMakeRange(6, 4)]
                    ];
        // 나머지 000-000-0000
        else
            return [NSString stringWithFormat:@"%@-%@-%@",
                    [rvalue substringWithRange:NSMakeRange(0, 3)],
                    [rvalue substringWithRange:NSMakeRange(3, 3)],
                    [rvalue substringWithRange:NSMakeRange(6, 4)]
                    ];
    }
    // 11글자
    // 000-0000-0000
    else if(rvalue.length == 11) {
        
        return [NSString stringWithFormat:@"%@-%@-%@",
                [rvalue substringWithRange:NSMakeRange(0, 3)],
                [rvalue substringWithRange:NSMakeRange(3, 4)],
                [rvalue substringWithRange:NSMakeRange(7, 4)]
                ];
    }
    else {
        return value == nil ? @"" : value;
    }
}


/**
 Description: 주소 문자열로부터 limit까지 space로 구분된 주소를 묶어서 반환
                예) 서울시 관악구 봉천동 limit2 -> 서울시 관악구
 Factors    : <# 인자 #>
 Return     : <# 반환 #>
 **/
+ (NSString *)cutAddress:(NSString *)addressStr limit:(NSInteger)limit
{
    NSArray *locationArray = [addressStr componentsSeparatedByString: @" "];
    NSString *cuttedAddress = @"";
    
    for (NSInteger i=0; i < limit; i++) {
        
        if (locationArray.count > i){
            
            if (i==0) cuttedAddress = [NSMutableString stringWithFormat:@"%@", [locationArray objectAtIndex:0]];
            else cuttedAddress = [NSMutableString stringWithFormat:@"%@ %@",cuttedAddress, [locationArray objectAtIndex:i]];
            
        }
        else break;
        
    }
    return cuttedAddress;
}

@end
