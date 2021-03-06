//
//  ViewController.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Accessors)

- (void)setString:(NSString *)str forKey:(NSString *)key;

- (BOOL)isKindOfClass:(Class)aClass forKey:(NSString *)key;
- (BOOL)isMemberOfClass:(Class)aClass forKey:(NSString *)key;
- (BOOL)isArrayForKey:(NSString *)key;
- (BOOL)isDictionaryForKey:(NSString *)key;
- (BOOL)isStringForKey:(NSString *)key;
- (BOOL)isNumberForKey:(NSString *)key;

- (NSArray *)arrayForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSNumber *)numberForKey:(NSString *)key;
- (double)doubleForKey:(NSString *)key;
- (float)floatForKey:(NSString *)key;
- (int)intForKey:(NSString *)key;
- (unsigned int)unsignedIntForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;
- (NSUInteger)unsignedIntegerForKey:(NSString *)key;
- (long long)longLongForKey:(NSString *)key;
- (unsigned long long)unsignedLongLongForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;




- (void)turnToClassName:(NSString *)className;
- (NSString *)interfaceCodesForName:(NSString *)className;
- (NSString *)implementCodesForName:(NSString *)className;

@end


@interface NSMutableDictionary (YLAdditions)

- (void)setValueReal:(id)value forKey:(NSString *)key;

@end
