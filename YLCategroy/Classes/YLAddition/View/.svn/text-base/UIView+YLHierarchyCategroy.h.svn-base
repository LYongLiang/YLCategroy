//
//  UIView+YLHierarchyCategroy.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YLHierarchyCategroy)

-(NSInteger)getSubviewIndex;

-(void)bringToFront;

-(void)sentToBack;

-(void)bringOneLevelUp;

-(void)sendOneLevelDown;

-(BOOL)isInFront;

-(BOOL)isAtBack;

-(void)swapDepthsWithView:(UIView*)swapView;

-(void)removeAllSubViews;


// DRAW GRADIENT
+ (void) drawGradientInRect:(CGRect)rect withColors:(NSArray*)colors;
+ (void) drawLinearGradientInRect:(CGRect)rect colors:(CGFloat[])colors;


// DRAW ROUNDED RECTANGLE
+ (void) drawRoundRectangleInRect:(CGRect)rect withRadius:(CGFloat)radius;

// DRAW LINE
+ (void) drawLineInRect:(CGRect)rect red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (void) drawLineInRect:(CGRect)rect colors:(CGFloat[])colors;
+ (void) drawLineInRect:(CGRect)rect colors:(CGFloat[])colors width:(CGFloat)lineWidth cap:(CGLineCap)cap;

// FILL RECT
+ (void)drawRect:(CGRect)rect fill:(const CGFloat*)fillColors radius:(CGFloat)radius;
+ (void)drawRect:(CGRect)rect fillColor:(UIColor *)fillColor radius:(CGFloat)radius;

// STROKE RECT
+ (void)strokeLines:(CGRect)rect stroke:(const CGFloat*)strokeColor ;

- (void)alphaAppearRemoveAnimation;

- (UIActivityIndicatorView *) activityWithOrigin:(CGPoint)pt;
- (UIActivityIndicatorView *) activityAtCenter;
- (UIActivityIndicatorView *) activityAtCenterWithSize:(CGSize)size;

- (UIViewController*)viewController;

@end


