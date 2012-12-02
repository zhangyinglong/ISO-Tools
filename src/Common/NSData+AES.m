//
//  NSData+AES.m
//  SHHFrameWorkWithNaviAndTabBar
//
//  Created by zhang yinglong on 12-11-6.
//  Copyright (c) 2012年 sui huan. All rights reserved.
//

#import "NSData+AES.h"
#import "MacroUtis.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (AES)

- (NSData *) AES256EncryptWithKey:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numByteEncrypted = 0;
    
    CCCryptorStatus cryptorStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                            kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr,
                                            kCCBlockSizeAES128, NULL, [self bytes], dataLength,
                                            buffer, bufferSize, &numByteEncrypted);
    if (cryptorStatus == kCCSuccess)
    {
        return [NSData dataWithBytesNoCopy:buffer length:numByteEncrypted];
    }
    free(buffer);
    return nil;
}

- (NSData *) AES256DecryptWithKey:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numByteDecrypted = 0;
    
    CCCryptorStatus cryptorStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                            kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr,
                                            kCCBlockSizeAES128, NULL, [self bytes], dataLength,
                                            buffer, bufferSize, &numByteDecrypted);
    if (cryptorStatus == kCCSuccess)
    {
        return [NSData dataWithBytesNoCopy:buffer length:numByteDecrypted];
    }
    free(buffer);
    return nil;
}

@end
