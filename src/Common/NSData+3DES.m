//
//  NSData+3DES.m
//  SHHFrameWorkWithNaviAndTabBar
//
//  Created by zhang yinglong on 12-11-6.
//  Copyright (c) 2012年 sui huan. All rights reserved.
//

#import "NSData+3DES.h"
#import "MacroUtis.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (TripleDES)

-(NSData *) tripleDESEncrypt:(NSString *)key
{
    char keyPtr[kCCKeySize3DES + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCKeySize3DES;
    void *buffer = malloc(bufferSize);
    size_t numByteEncrypted = 0;
    
    CCCryptorStatus cryptorStatus = CCCrypt(kCCEncrypt, kCCAlgorithm3DES,
                                            kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr,
                                            kCCKeySize3DES, NULL, [self bytes], dataLength,
                                            buffer, bufferSize, &numByteEncrypted);
    if (cryptorStatus == kCCSuccess)
    {
        return [NSData dataWithBytesNoCopy:buffer length:numByteEncrypted];
    }
    free(buffer);
    return nil;
}

-(NSData *) tripleDESDecrypt:(NSString *)key
{
    char keyPtr[kCCKeySize3DES + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSize3DES;
    void *buffer = malloc(bufferSize);
    size_t numByteDecrypted = 0;
    
    CCCryptorStatus cryptorStatus = CCCrypt(kCCDecrypt, kCCAlgorithm3DES,
                                            kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr,
                                            kCCKeySize3DES, NULL, [self bytes], dataLength,
                                            buffer, bufferSize, &numByteDecrypted);
    if (cryptorStatus == kCCSuccess)
    {
        return [NSData dataWithBytesNoCopy:buffer length:numByteDecrypted];
    }
    free(buffer);
    return nil;
}

@end
