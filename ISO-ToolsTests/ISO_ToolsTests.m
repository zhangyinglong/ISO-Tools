//
//  ISO_ToolsTests.m
//  ISO-ToolsTests
//
//  Created by zhang yinglong on 12-11-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ISO_ToolsTests.h"
#import "ISO-Tools.h"

@implementation ISO_ToolsTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testBitSet
{
    UInt64 value = 0;
    int flag = 1;
    for (int i = 0; i < sizeof(UInt64)*8; i++) {
        value = [Utility setBitMask:value andPos:i andFlag:flag];
        STAssertTrue(flag == [Utility bitMask:value andPos:i], @"error occur!");
    }
    STAssertTrue(UINT64_MAX == value, @"error occur!");
}

- (void)testBase64
{
    NSString *str = @"zhangyinglong";
    debugLog(@"str = %@", str);
    
    NSString *baseEncodeUTF8Str = [[str dataUsingEncoding:NSUTF8StringEncoding] base64EncodedUTF8String];
    debugLog(@"baseEncodeStr UTF8 = %@", baseEncodeUTF8Str);
    
    NSString *baseDecodeUTF8Str = [[NSString alloc] initWithData:[NSData dataFromBase64UTF8String:baseEncodeUTF8Str] encoding:NSUTF8StringEncoding];
    debugLog(@"baseDecodeStr UTF8 = %@", baseDecodeUTF8Str);
    
    NSString *baseEncodeASCIIStr = [[str dataUsingEncoding:NSASCIIStringEncoding] base64EncodedASCIIString];
    debugLog(@"baseEncodeStr ASCII = %@", baseEncodeASCIIStr);
    
    NSString *baseDecodeASCIIStr = [[NSString alloc] initWithData:[NSData dataWithBase64ASCIIString:baseEncodeUTF8Str] encoding:NSASCIIStringEncoding];
    debugLog(@"baseDecodeStr ASCII = %@", baseDecodeASCIIStr);
    
    STAssertEqualObjects(str, baseDecodeUTF8Str, @"testBase64 UTF8 failed!");
    STAssertEqualObjects(str, baseDecodeASCIIStr, @"testBase64 ASCII failed!");
}


- (void)testExample
{
//    STFail(@"Unit tests are not implemented yet in ISO-ToolsTests");
}

@end
