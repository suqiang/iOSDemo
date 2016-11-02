//
//  SQHXOREncryptUtil.h
//  iOSDemo
//
//  Created by 苏强 on 16/11/2.
//  Copyright © 2016年 suqianghotel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQHXOREncryptUtil : NSObject

+ (BOOL)xor_encryptWithString:(NSString *)originString toFile:(NSString *)file;

+ (NSData *)xor_encryptWithFilename:(NSString *)filename type:(NSString *)type;

+ (NSData *)xor_encryptWithFile:(NSString *)file;

+ (NSData *)xor_encryptWithString:(NSString *)originString;
@end


@interface NSData(XOREncrypt)

/** 加密 */
- (NSData *)xor_encrypt;

/** 解密 */
- (NSData *)xor_decrypt;

@end
