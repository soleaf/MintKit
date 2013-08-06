//
//  TestKit.m
//  mintKit
//
//  Created by soleaf on 13. 8. 1..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "TestKit.h"

#define TestKitConsoleName @"[TEST KIT]"

@implementation TestKit


/*
 * Normal Debugging
 *
 */

+ (void)debug:(NSString *)text
{
    NSLog(@"%@ [DEBUG] %@", TestKitConsoleName, text);
}

+ (void) debugKey:(NSString*)key andVal:(NSObject*) value
{
    NSLog(@"%@ [DEBUG] %@ : %@", TestKitConsoleName, key, value);
}

+ (void) debugCheckIsUsedMethod: (MINTKIT_DEBUG_METHOD_TYPE) methodName;
{
    NSLog(@"%@ [DEBUG] A used method detected > %s", TestKitConsoleName, methodName);
}



/*
 * OOP Class or method warnings
 *
 */

+ (void) notImplRequiredMthod: (MINTKIT_DEBUG_METHOD_TYPE) methodName
{
    NSLog(@"%@ [ ✕ REQURED METHOD] '%s' is not implemented. ", TestKitConsoleName, methodName);
    NSAssert(NO, @"Please Implement above method.");

}

+ (void) notImplOptionalMthod: (MINTKIT_DEBUG_METHOD_TYPE) methodName
{
    NSLog(@"%@ [ ✓ OPTIONAL METHOD] '%s' is not Implemented. But that's ok.", TestKitConsoleName, methodName);
}

+ (void) methodisDeprecated: (MINTKIT_DEBUG_METHOD_TYPE) methodName moveTo:(NSString*) newMethodName;
{
    NSLog(@"%@ [ ✓ DEPRECATED] '%s' is Deprecated. Please use '%@'.", TestKitConsoleName, methodName, newMethodName);
}

+ (void) methodNoUse: (MINTKIT_DEBUG_METHOD_TYPE) methodName
{
    NSLog(@"%@ [ ✕ NO USE] No use '%s'", TestKitConsoleName, methodName);
    NSAssert(NO, @"Please Do not use above method.");
}


@end
