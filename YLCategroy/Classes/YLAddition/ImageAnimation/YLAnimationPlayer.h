//
//  YLAnimationImageView.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/27.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void (^YLAnimationComplete) (BOOL isFinished);

@interface YLAnimationPlayer : UIImageView

@property(nonatomic) CGFloat  circleAnimationTime; // 动画持续时间 one animation time

@property (nonatomic) NSInteger repeatNum;  // default is 0 for unlimit num, 1 for 1 time, 2 for 2 times...

@property(nonatomic,strong)NSMutableArray *animationImageArray;


- (void)startAnimation;
- (void)stopAnimation;
- (BOOL)isAnimation;

- (id)initWithFrame:(CGRect)frame andAnimationImageArray:(NSMutableArray *)animationImageNameArray;

- (void)playAnimationWithImageArray:(NSMutableArray*)animationArray
                      oneCircleTime:(CGFloat)oneCircleTime
                          repeatNum:(NSInteger)repeatNUm
                           complete:(YLAnimationComplete)animationComplete;


@end
