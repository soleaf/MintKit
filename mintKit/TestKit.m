//
//  TestKit.m
//  travelogue
//
//  Created by flonelin on 13. 8. 1..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "TestKit.h"

#define TestKitConsoleName @"[TEST KIT]"

@implementation TestKit


/*
 * 일반 디버깅
 *
 */

+ (void)debug:(NSString *)text
{
    NSLog(@"%@ [DEBUG] %@", TestKitConsoleName, text);
}

+ (void) debugKey:(NSString*)key andVal:(NSObject*) value;
{
    NSLog(@"%@ [DEBUG] %@ : %@", TestKitConsoleName, key, value);
}

+(void)checkIsUsedMethod:(const char [60])methodName
{
    NSLog(@"%@ [DEBUG] 메서드 사용어부 확인됨: \n%s", TestKitConsoleName, methodName);
}


/*
 * 부가기능: 추후 분리고려
 *
 */

+ (void) alert:(NSString*)text;
{
    UIAlertView *alert = [[UIAlertView alloc]init];
    alert.message = text;
    [alert addButtonWithTitle:@"확인"];
    [alert show];
    
    [TestKit isDeprecated:__func__ moveTo:@"UIViewController.alertView:"];
}



/*
 * 메서드 경고, 및 알림
 *
 */

// methodName들은 __func__로 값을 넘기면 자동으로 됨
// 예: [TestKit DontUse:__func__];

+ (void) NotImplMthod: (const char[60]) methodName
{
    NSLog(@"%@ [!]호출한 메서드(%s)는 부모 혹은 자식에서 구현되지 않았습니다.", TestKitConsoleName, methodName);
    NSAssert(NO, @"------ TEST KIT-------");

}

+ (void) NotImplMthodNoti: (const char[60]) methodName
{
    NSLog(@"%@ [!]호출한 메서드(%s)는 부모 혹은 자식에서 구현되지 않았습니다. 하지만 문제는 없습니다.", TestKitConsoleName, methodName);
}

+ (void) isDeprecated: (const char[60]) methodName moveTo:(NSString*) newMethodName;
{
    NSLog(@"%@ [!] 호출하는 메서드(%s)는 Deprecated되었습니다. 다음 메서드(%@)를 사용해야합니다.", TestKitConsoleName, methodName, newMethodName);
}

+ (void) DontUse: (const char[60]) methodName;
{
    NSLog(@"%@ [!] 호출하는 메서드(%s)는 사용이 중단되었습니다.", TestKitConsoleName, methodName);
    NSAssert(NO, @"------ TEST KIT-------");
}


@end
