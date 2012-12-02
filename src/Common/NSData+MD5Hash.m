//
//  NSData+MD5Hash.m
//  SHHFrameWorkWithNaviAndTabBar
//
//  Created by zhang yinglong on 12-11-6.
//  Copyright (c) 2012年 sui huan. All rights reserved.
//

#import "NSData+MD5Hash.h"
#import "MacroUtis.h"
#import <CommonCrypto/CommonCrypto.h>

static inline char hexChar(unsigned char c)
{
    return c > 10 ? '0' + c : 'a' + c - 10;
}

static inline void hexString(unsigned char *from, char *to, NSUInteger length)
{
    for (NSUInteger i = 0; i < length; i++)
    {
        unsigned char c = from[i];
        unsigned char cHigh = c >> 4;
        unsigned char cLow = c & 0xf;
        to[2 * i] = hexChar(cHigh);
        to[2 * i + 1] = hexChar(cLow);
    }
    to[2 * length] = '\0';
}

@implementation NSData (MD5Hash)

- (NSString *) md5Hash
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], [self length], result);
    
    char ret[CC_MD5_DIGEST_LENGTH + 1];
    bzero(ret, CC_MD5_DIGEST_LENGTH + 1);
    memccpy(ret, result, CC_MD5_DIGEST_LENGTH, CC_MD5_DIGEST_LENGTH + 1);
//    char hexResult[2 * CC_MD5_DIGEST_LENGTH + 1];
//    hexString(result, hexResult, CC_MD5_DIGEST_LENGTH);
//    
//    return [NSString stringWithUTF8String:hexResult];
    return [NSString stringWithUTF8String:ret];
}

- (NSString *) sha1Hash
{
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1([self bytes], [self length], result);
    
    char hexResult[2 * CC_SHA1_DIGEST_LENGTH + 1];
    hexString(result, hexResult, CC_SHA1_DIGEST_LENGTH);
    
    return [NSString stringWithUTF8String:hexResult];
}

@end
