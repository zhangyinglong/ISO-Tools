//
//  Utility.m
//  ISO-Tools
//
//  Created by yinglong zhang on 12-12-2.
//
//

#import "Utility.h"

@implementation Utility

SYNTHESIZE_SINGLETON_FOR_CLASS(Utility);

+(UInt64) setBitMask:(UInt64)value andPos:(int)pos andFlag:(int)flag {
    if ( 0 == flag ) {
        value &= ~(1 << pos);
    }
    else {
        value |= (1 << pos);
    }
    return value;
}

+(int) bitMask:(UInt64)value andPos:(int)pos {
    return value & (1 << pos) ? 1 : 0;
}

@end
