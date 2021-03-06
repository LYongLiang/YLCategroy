//
//  UILabel+YLExtension.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YLExtension)

// --------------------------------------------------------------------
// Creation

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
                        tag:(NSInteger)tag
                  hasShadow:(BOOL)hasShadow;


+ (UILabel *) labelWithText:(NSString *)text font:(UIFont *)font x:(CGFloat)x y:(CGFloat)y;
+ (UILabel *) labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font x:(CGFloat)x y:(CGFloat)y;

+ (UILabel *) labelWithFrame:(CGRect)frame textColor:(UIColor *)textColor font:(UIFont *)font;

// --------------------------------------------------------------------
// Property Setting

+ (void) setLableText:(UILabel *)label text:(NSString *)text;

@end
