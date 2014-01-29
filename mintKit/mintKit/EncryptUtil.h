//
//  EncryptUtil.h
//  mintKit
//
//  Created by soleaf on 13. 11. 20..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptUtil : NSObject

/*
 AES
 */

// Encrypt string to NSData
+ (NSData*) AESEncrypt:(NSString*)plaintext withKey:(NSString*)key;
// Encrypt string to Base64 NSString
+ (NSString*) stringAESEncrypt:(NSString*)plaintext withKey:(NSString*)key;

// Decript NSData to base65 NSString
+ (NSString*) AESDecrypt:(NSData*)data withKey:(NSString*)key;
// Descript NSdata to utf8 NSString(common used encoding)
+ (NSString *) AESDecryptWithString:(NSString *)base64string withKey:(NSString *)key;


/*
 MD5
 */
+ (NSString*) md5:(NSString*)input;


/*
 Stuff
 */
+ (NSString*) base64forData:(NSData*)theData;
@end
