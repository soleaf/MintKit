//
//  MapUtil.h
//  mintKit
//
//  Created by soleaf on 13. 2. 13..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

/*
    MKMapKit assistance
 */

@interface MapUtil : NSObject

/*
    Convert bettwen 2D Coordinate and address
 */

// Address from CLLocationCoordinate2D by GoogleMapAPI.
// lang is display language -> ex 'ko'
+ (NSString *) getAddressFromCoordinate:(CLLocationCoordinate2D) location andLang:(NSString*) lang;

// CLLocationCoordinate2D Dictoinary from address by GoogleMapAPI.
+ (NSDictionary *) getCoordinateFromAddress:(NSString*) address;

@end
