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
 * Error handelling
 * : Just loging.
 */

+ (void)errorRuntime:(MINTKIT_DEBUG_METHOD_TYPE)methodName
{
    [TestKit errorRuntime:methodName code:nil reason:nil error:nil];
}

+ (void)errorRuntime:(MINTKIT_DEBUG_METHOD_TYPE)methodName code:(NSString *)code
{
    [TestKit errorRuntime:methodName code:code reason:nil error:nil];
}

+ (void) errorRuntime:(MINTKIT_DEBUG_METHOD_TYPE) methodName code:(NSString*) code reason:(NSString*) reason;
{
    [TestKit errorRuntime:methodName code:code reason:reason error:nil];
}

+ (void) errorRuntime:(MINTKIT_DEBUG_METHOD_TYPE) methodName code:(NSString*) code reason:(NSString*) reason error:(NSError*) errorObj
{
    code    = code?     [NSString stringWithFormat:@" [%@]",code]   : @"";
    reason  = reason?   [NSString stringWithFormat:@" [%@]",reason] : @"";
    
    NSString *errorObjStr = errorObj ? [NSString stringWithFormat:@"\nNSError:\n%@",errorObj] : @"";
    
    NSLog(@"%@ [ ✕ ERROR]%@%@", code, reason, errorObjStr);
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

+ (void)needDelegate:(__unsafe_unretained Class) instance;
{
    NSLog(@"%@ [ ✕ NEED DELEGATE] for '%@", TestKitConsoleName,  NSStringFromClass(instance));
    NSAssert(NO, @"Please Do set delegate!");
}

@end
