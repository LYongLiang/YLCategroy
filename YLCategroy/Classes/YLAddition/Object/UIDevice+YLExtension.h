//
//  UIDevice+YLExtension.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (YLExtension)

- (NSString *)machine;
+ (NSString *)platform;
+ (NSString *)platformString;
- (NSString *)uniqueDeviceIdentifier;
- (NSString *)uniqueGlobalDeviceIdentifier;

/*
 *  检测设备是否越狱
 *  @return BOOL
 */
+ (BOOL)isJailBreak;

@end
