//
//  EncryptUtil.h
//  mintKit
//
//  Created by soleaf on 13. 11. 20..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptUtil : NSObject

//- (NSString *) md5:(NSString *) input;
+ (NSData*) AESEncrypt:(NSString*)plaintext withKey:(NSString*)key;
+ (NSString*) AESDecrypt:(NSData*)ciphertext withKey:(NSString*)key;
+ (NSString*)md5:(NSString*)input;
@end
