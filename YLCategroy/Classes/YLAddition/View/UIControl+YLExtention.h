//
//  UIControl+YLExtention.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (YLExtention)

///处理Button重复点击问题
///点击事件的时间间隔
@property (nonatomic, assign) NSTimeInterval acceptEventTimeInterval;

@end
