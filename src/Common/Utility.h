//
//  Utility.h
//  ISO-Tools
//
//  Created by yinglong zhang on 12-12-2.
//
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"



@interface Utility : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(Utility);

+(UInt64) setBitMask:(UInt64)value andPos:(int)pos andFlag:(int)flag;
+(int) bitMask:(UInt64)value andPos:(int)pos;

@end
