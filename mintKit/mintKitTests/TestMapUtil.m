//
//  TestMapUtil.m
//  mintKit
//
//  Created by soleaf on 13. 10. 14..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "TestMapUtil.h"
#import "MapUtil.h"
#import <CoreLocation/CoreLocation.h>

@implementation TestMapUtil

- (void)testGetAddressFromCoordinate
{
    NSString *address = [MapUtil getAddressFromCoordinate:CLLocationCoordinate2DMake(37.56843, 126.9818) andLang:@"ko"];
    
    NSLog(@"address: %@",address);
    STAssertNotNil(address,@"address");
}
@end
