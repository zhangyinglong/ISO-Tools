//
//  NSData+Base64.h
//  SHHFrameWorkWithNaviAndTabBar
//
//  Created by zhang yinglong on 12-11-5.
//  Copyright (c) 2012年 sui huan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)

+ (NSData *) dataFromBase64String:(NSString *)aString;

- (NSString *) base64EncodedString;

- (NSString *) base64EncodedStringWithSeparateLines:(BOOL)separateLines;

@end
