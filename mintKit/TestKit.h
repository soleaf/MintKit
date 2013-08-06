//
//  TestKit.h
//  mintKit
//
//  Created by soleaf on 13. 8. 1..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
    TestKit is help loging and debuging your application.
    Debuging log should separated by unrecognized 'nslog'. In this case, Use 'debug:' method.
    In Object Oriend Programing, Some methods that checking implement method could be used.
*/

// This factor on methods be used '__func__' or 'MINTKIT_DEBUG_METHOD'
// ex) [TestKit methodNoUse:__func__]; or [TestKit methodNoUse:MINTKIT_DEBUG_METHOD]; 
#define MINTKIT_DEBUG_METHOD __func__
#define MINTKIT_DEBUG_METHOD_TYPE const char[60]

@interface TestKit : NSObject


/*
 * Normal Debugging
 *
 */

// Print text
+ (void) debug:(NSString*) text;

// Print Object with key
+ (void) debugKey:(NSString*)key andVal:(NSObject*) value;

// Check method is used.
+ (void) debugCheckIsUsedMethod: (MINTKIT_DEBUG_METHOD_TYPE) methodName;



/*
 * OOP Class or method warnings
 *
 */

// A required method is not implemented by supperclass or subclass. Stop app.
+ (void) notImplRequiredMthod: (MINTKIT_DEBUG_METHOD_TYPE) methodName;

// A optional method is not implemented by supperclass or subclass. Just warning.
+ (void) notImplOptionalMthod: (MINTKIT_DEBUG_METHOD_TYPE) methodName;

// Called method is deprecated. Just warning.
+ (void) methodisDeprecated: (MINTKIT_DEBUG_METHOD_TYPE) methodName moveTo:(NSString*) newMethodName;

// No use this method
+ (void) methodNoUse: (MINTKIT_DEBUG_METHOD_TYPE) methodName;
@end
