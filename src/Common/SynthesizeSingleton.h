//
//  SynthesizeSingleton.h
//  ISO-Tools
//
//  Created by yinglong zhang on 12-12-2.
//
//

#ifndef SYNTHESIZE_SINGLETON_FOR_CLASS

#define SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(classname)	\
\
+ (classname*) shared##classname;

#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
    @synchronized(self) \
    { \
        if (shared##classname == nil) \
        { \
            shared##classname = [[self alloc] init]; \
        } \
    } \
    return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
    @synchronized(self) \
    { \
        if (shared##classname == nil) \
        { \
            shared##classname = [super allocWithZone:zone]; \
        } \
    } \
    return shared##classname; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
    return self; \
} \
\
- (id)retain	\
{	\
    return self;	\
}	\
\
- (NSUInteger)retainCount	\
{	\
    return NSUIntegerMax;	\
}	\
\
- (oneway void)release \
{ \
} \
\
- (id)autorelease \
{ \
    return self; \
}

#endif // SYNTHESIZE_SINGLETON_FOR_CLASS
