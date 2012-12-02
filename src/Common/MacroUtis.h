//
//  MacroUtis.h
//  ISO-Tools
//
//  Created by yinglong zhang on 12-11-28.
//
//

#pragma once

#ifdef DEBUG

#define debugLog(...)   NSLog(__VA_ARGS__)
#define debugMethod()   NSLog()

#else

#define debugLog(...)
#define debugMethod()

#endif

#define EMPTY_STRING        @""

#define STR(key)            NSLocalizedString(key, nil)

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


#define APP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define RGB(A, B, C)        [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]

#define TT_FIX_CATEGORY_BUG(name) @interface TT_FIX_CATEGORY_BUG_##name @end \
                                    @implementation TT_FIX_CATEGORY_BUG_##name @end


//#define SETBITMASK(value, pos, isZero) \
//do { \
//    @try { \
//        __typeof__(value) v = (value); \
//        __typeof__(pos) p = (pos); \
//        __typeof__(isZero) z = (isZero); \
//        if ( z ) { \
//            v &= ~(1 << p); \
//        } \
//        else { \
//            v |= (1 << p); \
//        } \
//        return v; \
//    } \
//    @catch (id anException) { \
//        debugLog(@"Catch a exception : %@, beacause of %@, in %@ %@", [anException name], [anException reason], __FILE__, __LINE__); \
//    } \
//} while (0)
//
//#define BITMASK(value, pos) \
//do { \
//    @try { \
//        __typeof__(value) v = (value); \
//        __typeof__(pos) p = (pos); \
//        return v & (1 << p);\
//    } \
//    @catch (id anException) { \
//        debugLog(@"Catch a exception : %@, beacause of %@, in %@ %@", [anException name], [anException reason], __FILE__, __LINE__); \
//    } \
//} while (0)
