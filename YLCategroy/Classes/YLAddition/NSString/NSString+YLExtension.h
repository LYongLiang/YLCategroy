//
//  NSString+YLExtension.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class EmojiClass;


@interface NSString (YLJsonTool)

//字典转json
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

//json转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;


@end




@interface NSString (YLExtension)

/**
 *  计算字符串的大小
 *  @param font font
 *  @param maxSize size
 *  @return size
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

///禁止表情输入
+ (BOOL)isContainsEmoji:(NSString *)string;
+ (EmojiClass*)isTextContainsEmoji:(NSString *)string;
- (NSString *)URLEncodedString;

- (NSString *)md5Hash;


@end


@interface EmojiClass : NSObject

@property (nonatomic, assign, getter=isEmoji) BOOL emoji;//是否为表情
@property (nonatomic, assign) NSRange substringRange;
@end
