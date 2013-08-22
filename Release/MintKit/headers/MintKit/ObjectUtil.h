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


// Check A point is equal to other point.
+ (BOOL) CGPoint:(CGPoint) point isEqual:(CGPoint) otherPoint;

@end
