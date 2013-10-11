//
//  ObjectUtil.h
//  travelogue
//
//  Created by flonelin on 13. 7. 30..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 ObjectUtil supply some object tools.
 These methods could be moved into other class.
 
 */

@interface ObjectUtil : NSObject

/*
 
 Comparison
 
 */

// Check A point is equal to other point.
// (You can use 'CGPointEqualToPoint' <-- I dont know this function exists :( When made it.)
+ (BOOL) CGPoint:(CGPoint) point isEqual:(CGPoint) otherPoint;


/*
 
 Deep Copy
 
 */
+ (NSMutableDictionary *)deepCopyNSMutableDictionary:(NSMutableDictionary *)originalDictionary;
+ (NSMutableArray *)deepCopyNSMutableArray:(NSMutableArray*) originalArray;


@end
