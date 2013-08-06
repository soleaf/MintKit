//
//  MapUtil.h
//  travelogue
//
//  Created by ilho Ahn on 13. 2. 13..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MapUtil : NSObject

+ (NSString *)getAddressFromCoordinate:(CLLocationCoordinate2D)location;
+ (NSDictionary *)getCoordinateFromAddress:(NSString*)address;

@end
