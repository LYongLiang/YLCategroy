
//
//  YLSingleton.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#ifndef YLSingleton_h
#define YLSingleton_h

#define singletonInterface(className)   + (instancetype)shared##className;

#if __has_feature(objc_arc)
/**
 *  ARC Version
 */
#define singletonImplementation(className)  \
static id instance; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone {  \
static dispatch_once_t onceToken;   \
dispatch_once(&onceToken, ^{    \
if (instance == nil) {  \
instance = [super allocWithZone:zone];  \
}   \
}); \
return instance;    \
}   \
+ (instancetype)shared##className { \
static dispatch_once_t onceToken;   \
dispatch_once(&onceToken, ^{    \
instance = [[self alloc] init]; \
}); \
return instance;    \
}   \
- (id)copyWithZone:(NSZone *)zone { \
return instance;    \
}
#else
/**
 *  MRC Version
 */
#define singletonImplementation(className)  \
static id instance; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone {  \
static dispatch_once_t onceToken;   \
dispatch_once(&onceToken, ^{    \
if (instance == nil) {  \
instance = [super allocWithZone:zone];  \
}   \
}); \
return instance;    \
}   \
+ (instancetype)shared##className { \
static dispatch_once_t onceToken;   \
dispatch_once(&onceToken, ^{    \
instance = [[self alloc] init]; \
}); \
return instance;    \
}   \
- (id)copyWithZone:(NSZone *)zone { \
return instance;    \
}   \
- (oneway void)release {}   \
- (instancetype) retain {return instance;}  \
- (instancetype) autorelease {return instance;} \
- (NSUInteger) retainCount {return ULONG_MAX;}
#endif

#endif /* YLSingleton_h */
