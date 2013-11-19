//
//  MapUtil.h
//  mintKit
//
//  Created by soleaf on 13. 2. 13..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "MapUtil.h"

@implementation MapUtil

+ (NSString *)getAddressFromCoordinate:(CLLocationCoordinate2D)location andLang:(NSString *)lang
{
    NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?latlng=%f,%f&language=%@&sensor=false", location.latitude, location.longitude,lang];

    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    if (!data) return nil;
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray* resultArray = [json objectForKey:@"results"];
    if (error) return nil;
    
    if (resultArray != nil && [resultArray objectAtIndex:0] != nil && [[resultArray objectAtIndex:0] objectForKey:@"formatted_address"]){
        NSString* locationString = [[resultArray objectAtIndex:0] objectForKey:@"formatted_address"];
        
            return locationString;
    }
    
	return nil;
}

+ (NSDictionary *)getCoordinateFromAddress:(NSString*)address
{
    NSString *urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=false", address];
    urlString= [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    if (!data) return nil;
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data //1
                          
                          options:kNilOptions
                          error:&error];
    
    if (![json objectForKey:@"results"]) return nil;
    
    NSArray* resultArray = [json objectForKey:@"results"];
    
    
    if ( resultArray.count > 0 && [resultArray objectAtIndex:0]){
        NSDictionary* geometry = [[[resultArray objectAtIndex:0] objectForKey:@"geometry"] objectForKey:@"location"];
        
        return geometry;
    }
	return nil;
}


@end
