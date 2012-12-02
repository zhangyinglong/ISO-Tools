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

- (void)testBase64
{
    NSString *str = @"zhangyinglong";
    debugLog(@"str = %@", str);
    NSString *baseEncodeStr = [[str dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString];
    debugLog(@"baseEncodeStr = %@", baseEncodeStr);
    NSString *baseDecodeStr = [[NSString alloc] initWithData:[NSData dataFromBase64String:baseEncodeStr] encoding:NSUTF8StringEncoding];
    debugLog(@"baseDecodeStr = %@", baseDecodeStr);
    STAssertEqualObjects(str, baseDecodeStr, @"testBase64 failed!");
}


- (void)testExample
{
//    STFail(@"Unit tests are not implemented yet in ISO-ToolsTests");
}

@end
