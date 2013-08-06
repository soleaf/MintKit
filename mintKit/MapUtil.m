//
//  MapUtil.m
//  travelogue
//
//  Created by ilho Ahn on 13. 2. 13..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "MapUtil.h"

@implementation MapUtil

#pragma mark - GPS값으로 주소를 얻어온다.
+ (NSString *)getAddressFromCoordinate:(CLLocationCoordinate2D)location
{
    NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?latlng=%f,%f&language=ko&sensor=false", location.latitude, location.longitude];
    //NSLog(@"urlString :%@",urlString);

    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    if (!data) return nil;
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray* resultArray = [json objectForKey:@"results"];
    if (error) return nil;
    
    if ([resultArray objectAtIndex:0] != nil && [[resultArray objectAtIndex:0] objectForKey:@"formatted_address"]){
        NSString* locationString = [[resultArray objectAtIndex:0] objectForKey:@"formatted_address"];
        NSLog(@"locationString :%@",locationString);
        
            return locationString;
    }
    
	return nil;
}


#pragma mark - 장소명으로 좌표가져오기
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
        NSLog(@"urlString: %@ geo :%@",urlString,geometry);
        
        return geometry;
    }
	return nil;
}


@end
