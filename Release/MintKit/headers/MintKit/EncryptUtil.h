//
//  EncryptUtil.h
//  mintKit
//
//  Created by soleaf on 13. 11. 20..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptUtil : NSObject

// AES
+ (NSData*) AESEncrypt:(NSString*)plaintext withKey:(NSString*)key;
+ (NSString*) stringAESEncrypt:(NSString*)plaintext withKey:(NSString*)key;
+ (NSString*) AESDecrypt:(NSData*)ciphertext withKey:(NSString*)key;

// MD5
+ (NSString*) md5:(NSString*)input;

// Stuff
+ (NSString*) base64forData:(NSData*)theData;
@end
