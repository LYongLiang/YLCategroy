//
//  YLAnimationImageView.m
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/27.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import "YLAnimationPlayer.h"
#import "UIImage+YLExtension.h"

@interface YLAnimationPlayer ()

{
    NSInteger count;
    NSInteger index; //定位当前播放的图片
    NSInteger transformatRate; //转化率
    
    CGFloat  frequency; // 频率
    CGFloat currentRepeatNum;
    
    YLAnimationComplete tempAnimationComplete;
    
    CADisplayLink  *displayLink; // 定时器
    
}


@end

@implementation YLAnimationPlayer

- (instancetype)initWithFrame:(CGRect)frame andAnimationImageArray:(NSMutableArray *)animationImageNameArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.animationImageArray = [[NSMutableArray alloc] initWithArray:animationImageNameArray];
        
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.repeatNum = 0;
        currentRepeatNum = 0;
        _circleAnimationTime = 1;
    }
    return self;
}


- (void)playAnimationWithImageArray:(NSMutableArray*)animationArray
                      oneCircleTime:(CGFloat)oneCircleTime
                          repeatNum:(NSInteger)repeatNUm
                           complete:(YLAnimationComplete)animationComplete
{
    
    
    self.repeatNum = repeatNUm;
    
    
    // 动画播放数组为空 直接返回  动画没有完成;
    if (!animationArray.count){
        animationComplete(NO);
        return;
    }
    
    
    //时间为零 直接返回
    if (time <= 0){
        return;
    }
    
    
    
    frequency = oneCircleTime/animationArray.count;
    transformatRate = (NSInteger)(frequency * 60);
    
    if (transformatRate == 0) {
        
        transformatRate = 1;
        
    }
    
    
    //_disPlayelink 还存在表明动画没有完成
    
    if (displayLink) {
        
        //使动画停止
        [displayLink invalidate];
        displayLink = nil;
        
        //计数 重新归 0
        count = 0;
        index = 0;
        animationComplete(NO);
        return;
    }
    
    self.animationImageArray = animationArray;
    
    self.circleAnimationTime = oneCircleTime;
    
    count = 0;
    
    index = 0;
    
    //起 定时器
    
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateImage:)];
    
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop]forMode:NSDefaultRunLoopMode];
    
    tempAnimationComplete = animationComplete;
    
}


- (void)updateImage:(CADisplayLink*)displayLink{
    
    //1s/60
    
    if (!self.repeatNum) { //无限次数播发
        if (++count % transformatRate == 0 ) {
            
            
            self.image = [UIImage getPNGImage:[_animationImageArray objectAtIndex:index]];
            
            //动画完成
            
            if (index == self.animationImageArray.count - 1) {
                index = 0;
            }
            
            index++;
        }
    }else if (self.repeatNum > 0)
    {
        if (++count % transformatRate == 0 ) {
            
            self.image = [UIImage getPNGImage:[_animationImageArray objectAtIndex:index]];
            
            //一圈动画帧完成
            if (index == self.animationImageArray.count - 1) {
                index = 0;
                currentRepeatNum ++;
                
                if (currentRepeatNum == self.repeatNum) {
                    
                    [self stopAnimation];
                    tempAnimationComplete(YES);
                }
            }
            
            index++;
        }
    }
    
}





//========================================启动动画===========================================

- (void)startAnimation

{
    
    self.hidden = NO;
    // 动画播放数组为空 直接返回  动画没有完成;
    if (!_animationImageArray.count){
        self.hidden = YES;
        return;
    }
    
    //时间为零 直接返回
    if (time <= 0){
        self.hidden = YES;
        return;
    }
    
    frequency = _circleAnimationTime/_animationImageArray.count;
    transformatRate = (NSInteger)(frequency * 60);
    
    if (transformatRate == 0) {
        
        transformatRate = 1;
    }
    
    //_disPlayelink 还存在表明动画没有完成
    
    if (displayLink) {
        
        //使动画停止
        [displayLink invalidate];
        displayLink = nil;
        
        //计数 重新归 0
        count = 0;
        index = 0;
        self.hidden = YES;
        return;
    }
    
    count = 0;
    index = 0;
    currentRepeatNum = 0;
    
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(startUpdateImage:)];
    
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop]forMode:NSDefaultRunLoopMode];
    
}


//停止动画
- (void)stopAnimation
{
    if (displayLink) {
        
        currentRepeatNum = 0;
        count = 0;
        index = 0;
        self.hidden = YES;
        [displayLink invalidate];
        displayLink = nil;
    }
    
}


//动画是否进行中
- (BOOL)isAnimation
{
    if (displayLink) {
        return YES;
    }
    return NO;
}


- (void)startUpdateImage:(CADisplayLink*)displayLink{
    
    
    //1s/60
    
    if (!self.repeatNum) { //无限次数播发
        if (++count % transformatRate == 0 ) {
            
            
            self.image = [UIImage getPNGImage:[_animationImageArray objectAtIndex:index]];
            
            //动画完成
            
            if (index == self.animationImageArray.count - 1) {
                index = 0;
                //                count = 0;
            }
            
            index++;
        }
    }else if (self.repeatNum > 0)
    {
        
        if (++count % transformatRate == 0 ) {
            
            self.image = [UIImage getPNGImage:[_animationImageArray objectAtIndex:index]];
            
            //一圈动画帧完成
            if (index == self.animationImageArray.count - 1) {
                
                currentRepeatNum ++;
                index = 0;
                //                count = 0;
                if (currentRepeatNum == self.repeatNum) {
                    
                    [self stopAnimation];
                }
            }
            
            index++;
        }
        
    }
    
    
}

@end
