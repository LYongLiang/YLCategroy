//
//  NSObject+YLAdditions.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (YLAdditions)

//把传进来的数据为NSNull的对象移除
+ (id)turnNullToNilForObject:(id)item;
- (id)nilToNull;
- (id)nullToKong;
- (id)nullTonil;
- (id)objcetByRemoveNullObjects;

- (void)setArchiveredObject:(NSObject *)object forKey:(NSString *)key;
- (id)archiveredObjectForKey:(NSString *)key;


- (UIAlertView *)showAlertWith:(NSString *)title andMessage:(NSString *)message;
- (void)showHttpError;

@end
