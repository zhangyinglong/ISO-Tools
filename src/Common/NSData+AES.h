//
//  NSData+AES.h
//  SHHFrameWorkWithNaviAndTabBar
//
//  Created by zhang yinglong on 12-11-6.
//  Copyright (c) 2012年 sui huan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)

// AES256 encrypt
- (NSData *) AES256EncryptWithKey:(NSString *)key;

// AES256 decrypt
- (NSData *) AES256DecryptWithKey:(NSString *)key;

@end
