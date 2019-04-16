//
//  YLAudioPlayer.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface YLAudioPlayer : NSObject

/**
 *  播放音效
 *
 *  @param fileName 音效文件名
 */
+ (void)playSound:(NSString *)fileName;

/**
 *  销毁音效
 *
 *  @param fileName 音效文件名
 */
+ (void)disposeSound:(NSString *)fileName;

/**
 *  播放音乐
 *
 *  @param fileName 音乐文件名
 *
 *  @return 返回音乐播放器
 */
+ (AVAudioPlayer *)playMusic:(NSString *)fileName;

/**
 *  暂停音乐
 *
 *  @param fileName 音乐文件名
 */
+ (void)pauseMusic:(NSString *)fileName;

/**
 *  停止音乐
 *
 *  @param fileName 音乐文件名
 */
+ (void)stopMusic:(NSString *)fileName;

/**
 *  返回当前正在播放的音乐播放器
 *
 *  @return <#return value description#>
 */
+ (AVAudioPlayer *)currentPlayingAudioPlayer;

@end
