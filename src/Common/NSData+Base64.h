//
//  NSData+Base64.h
//  SHHFrameWorkWithNaviAndTabBar
//
//  Created by zhang yinglong on 12-11-5.
//  Copyright (c) 2012年 sui huan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)

+ (NSData *) dataFromBase64UTF8String:(NSString *)aString;

- (NSString *) base64EncodedUTF8String;

- (NSString *) base64EncodedUTF8StringWithSeparateLines:(BOOL)separateLines;

+ (NSData *) dataWithBase64ASCIIString:(NSString *)aString;

- (NSString *) base64EncodedASCIIString;

@end
