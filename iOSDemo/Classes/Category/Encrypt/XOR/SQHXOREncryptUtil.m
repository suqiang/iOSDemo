//
//  SQHXOREncryptUtil.m
//  iOSDemo
//
//  Created by 苏强 on 16/11/2.
//  Copyright © 2016年 suqianghotel. All rights reserved.
//

#import "SQHXOREncryptUtil.h"


@implementation SQHXOREncryptUtil

+ (BOOL)xor_encryptWithString:(NSString *)originString toFile:(NSString *)file
{
    NSData *encryptData = [self xor_encryptWithString:originString];
    
    return [encryptData writeToFile:file atomically:YES];
}

+ (NSData *)xor_encryptWithFilename:(NSString *)filename type:(NSString *)type
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:filename ofType:type];
    
    return [self xor_encryptWithFile:filepath];
}


+ (NSData *)xor_encryptWithFile:(NSString *)file
{
    NSData *data = [NSData dataWithContentsOfFile:file];
    
    return [data xor_encrypt];
}

+ (NSData *)xor_encryptWithString:(NSString *)originString
{
    NSData *data = [originString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data xor_encrypt];
}

@end

// 客户端内置私钥
static NSString const *privateKey = @"ef37c9111210854f5986fc9ebb5548b2ae";

@implementation NSData(XOREncrypt)

// 解密
- (NSData *)xor_decrypt
{
    return [self xor_encrypt];
}

// 加密
- (NSData *)xor_encrypt
{
    // 获取key的长度
    NSInteger length = privateKey.length;

    // 将OC字符串转换为C字符串
    const char *keys = [privateKey cStringUsingEncoding:NSASCIIStringEncoding];
    
    unsigned char cKey[length];
    
    memcpy(cKey, keys, length);
    
    // 数据初始化，空间未分配 配合使用 appendBytes
    NSMutableData *encryptData = [[NSMutableData alloc] initWithCapacity:length];
    
    // 获取字节指针
    const Byte *point = self.bytes;
    
    for (int i = 0; i < self.length; i++) {
        int l = i % length;                     // 算出当前位置字节，要和密钥的异或运算的密钥字节
        char c = cKey[l];
        Byte b = (Byte) ((point[i]) ^ c);       // 异或运算
        [encryptData appendBytes:&b length:1];  // 追加字节
    }
    
    return encryptData.copy;
    
}
@end
