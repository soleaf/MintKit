//
//  TestEncryptUtil.m
//  mintKit
//
//  Created by soleaf on 13. 11. 25..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "TestEncryptUtil.h"
#import "EncryptUtil.h"

@implementation TestEncryptUtil


- (void)testAESEncrypt
{
    NSString *target = @"target";
    NSString *key = @"1234567890123456";
    
    NSData *enc = [EncryptUtil AESEncrypt:target withKey:key];
    NSString *dec = [EncryptUtil AESDecrypt:enc withKey:key];
    NSString *encStr = [enc base64Encoding];
    
    STAssertTrue([encStr isEqualToString:@"ePTziIMe9QTvCq5NO0pa4g=="], @"Encrypting Error");
    STAssertTrue([target isEqualToString:dec], @"Decripting Error");
}

- (void)testMD5Encrypt
{
    NSString *input = @"hello!!";
    NSString *encripted = [EncryptUtil md5:input];
    
    STAssertTrue([encripted isEqualToString:@"81d95db337a18c65384d35ba7ea2efda"], @"Encripting Error");
    
}
@end
