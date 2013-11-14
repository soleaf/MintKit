//
//  FormatUtil.m
//  mintKit
//
//  Created by soleaf on 13. 7. 18..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "FormatUtil.h"
#import "StringUtil.h"

@implementation FormatUtil


+ (NSString*) toPhoneNumberwithDash:(NSString *) value
{
    NSString *rvalue = value == nil ? @"" : [[StringUtil trimed:value] stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    // Length 9
    // 00-000-0000
    if(rvalue.length == 9) {
        return [NSString stringWithFormat:@"%@-%@-%@",
                                            [rvalue substringWithRange:NSMakeRange(0, 2)],
                                            [rvalue substringWithRange:NSMakeRange(2, 3)],
                                            [rvalue substringWithRange:NSMakeRange(5, 4)]
                ];
    }
    // Length 8
    // 0000-0000
    else if(rvalue.length == 8) {
        
        return [NSString stringWithFormat:@"%@-%@",
                [rvalue substringWithRange:NSMakeRange(0, 4)],
                [rvalue substringWithRange:NSMakeRange(4, 4)]
                ];
        
    }
    // Length 10
    else if(rvalue.length == 10) {
        
        // Start by '02'
        // 02-0000-0000
        if ([@"02" isEqualToString:[rvalue substringWithRange:NSMakeRange(0, 2)]])
            return [NSString stringWithFormat:@"%@-%@-%@",
                    [rvalue substringWithRange:NSMakeRange(0, 2)],
                    [rvalue substringWithRange:NSMakeRange(2, 4)],
                    [rvalue substringWithRange:NSMakeRange(6, 4)]
                    ];
        // else 000-000-0000
        else
            return [NSString stringWithFormat:@"%@-%@-%@",
                    [rvalue substringWithRange:NSMakeRange(0, 3)],
                    [rvalue substringWithRange:NSMakeRange(3, 3)],
                    [rvalue substringWithRange:NSMakeRange(6, 4)]
                    ];
    }
    // Length 11
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

+ (NSString *)toCurrency:(NSNumber*)number
{
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return [formatter stringFromNumber:number];
}

@end
