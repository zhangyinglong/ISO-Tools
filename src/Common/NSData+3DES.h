//
//  NSData+3DES.h
//  SHHFrameWorkWithNaviAndTabBar
//
//  Created by zhang yinglong on 12-11-6.
//  Copyright (c) 2012年 sui huan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (TripleDES)

-(NSData *) tripleDESEncrypt:(NSString *)key;

-(NSData *) tripleDESDecrypt:(NSString *)key;

@end
