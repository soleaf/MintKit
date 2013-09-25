//
//  TestFormatUtil.m
//  mintKit
//
//  Created by soleaf on 13. 9. 25..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "TestFormatUtil.h"
#import "FormatUtil.h"

@implementation TestFormatUtil

- (void)testToPhoneNumberwithDash
{
    STAssertTrue([@"12-345-6789" isEqualToString:[FormatUtil toPhoneNumberwithDash:@"123456789"]], @"Correct : 123456789 -> 12-345-6789");
    STAssertTrue([@"1234-5678" isEqualToString:[FormatUtil toPhoneNumberwithDash:@"12345678"]], @"Correct : 12345678 -> 1234-5678");
    STAssertTrue([@"123-456-7890" isEqualToString:[FormatUtil toPhoneNumberwithDash:@"1234567890"]], @"Correct : 1234567890 -> 123-456-7890");
    STAssertTrue([@"02-3456-7890" isEqualToString:[FormatUtil toPhoneNumberwithDash:@"0234567890"]], @"Correct : 0234567890 -> 02-3456-7890");
    STAssertTrue([@"123-4567-8901" isEqualToString:[FormatUtil toPhoneNumberwithDash:@"12345678901"]], @"Correct : 12345678901 -> 123-4567-8901");
}

- (void)testCutAddresslimit
{
    STAssertTrue([@"23-23, city" isEqualToString:[FormatUtil cutAddress:@"23-23, city nation" limit:2]], @"23-23, city nation -> 23-23, city");
}


@end
