//
//  UIView+YLHierarchyCategroy.m
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import "UIView+YLHierarchyCategroy.h"
#define kActivityTag        9212111


@implementation UIView (YLHierarchyCategroy)

-(NSInteger)getSubviewIndex
{
    return [self.superview.subviews indexOfObject:self];
}

-(void)bringToFront
{
    [self.superview bringSubviewToFront:self];
}

-(void)sentToBack
{
    [self.superview sendSubviewToBack:self];
}

-(void)bringOneLevelUp
{
    NSInteger currentIndex = [self getSubviewIndex];
    [self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex+1];
}

-(void)sendOneLevelDown
{
    NSInteger currentIndex = [self getSubviewIndex];
    [self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex-1];
}

-(BOOL)isInFront
{
    return ([self.superview.subviews lastObject]==self);
}

-(BOOL)isAtBack
{
    return ([self.superview.subviews objectAtIndex:0]==self);
}

-(void)swapDepthsWithView:(UIView*)swapView
{
    if (!swapView || !swapView.superview || !self.superview || self.superview != swapView.superview) {
        return;
    }
    [self.superview exchangeSubviewAtIndex:[self getSubviewIndex] withSubviewAtIndex:[swapView getSubviewIndex]];
}




CGPoint demoLGStart(CGRect bounds){
    return CGPointMake(bounds.origin.x, bounds.origin.y + bounds.size.height * 0.25);
}
CGPoint demoLGEnd(CGRect bounds){
    return CGPointMake(bounds.origin.x, bounds.origin.y + bounds.size.height * 0.75);
}
CGPoint demoRGCenter(CGRect bounds){
    return CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
}
CGFloat demoRGInnerRadius(CGRect bounds){
    CGFloat r = bounds.size.width < bounds.size.height ? bounds.size.width : bounds.size.height;
    return r * 0.125;
}


+ (void) drawGradientInRect:(CGRect)rect withColors:(NSArray*)colors{
    
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors){
        [ar addObject:(id)c.CGColor];
    }
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    
    
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)ar, NULL);
    
    
    CGContextClipToRect(context, rect);
    
    CGPoint start = CGPointMake(0.0, 0.0);
    CGPoint end = CGPointMake(0.0, rect.size.height);
    
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    
}


+ (void) drawLinearGradientInRect:(CGRect)rect colors:(CGFloat[])colours{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colours, NULL, 2);
    CGColorSpaceRelease(rgb);
    CGPoint start, end;
    
    start = demoLGStart(rect);
    end = demoLGEnd(rect);
    
    
    
    CGContextClipToRect(context, rect);
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradient);
    
    CGContextRestoreGState(context);
    
}



+ (void) drawRoundRectangleInRect:(CGRect)rect withRadius:(CGFloat)radius{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGRect rrect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
    
    CGFloat minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), maxy = CGRectGetMaxY(rrect);
    CGContextMoveToPoint(context, minx, midy);
    CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
}




+ (void) drawLineInRect:(CGRect)rect colors:(CGFloat[])colors {
    
    [UIView drawLineInRect:rect colors:colors width:1 cap:kCGLineCapButt];
    
}
+ (void) drawLineInRect:(CGRect)rect red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    CGFloat colors[4];
    colors[0] = red;
    colors[1] = green;
    colors[2] = blue;
    colors[3] = alpha;
    [UIView drawLineInRect:rect colors:colors];
}


+ (void) drawLineInRect:(CGRect)rect colors:(CGFloat[])colors width:(CGFloat)lineWidth cap:(CGLineCap)cap{
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    
    CGContextSetRGBStrokeColor(context, colors[0], colors[1], colors[2], colors[3]);
    CGContextSetLineCap(context,cap);
    CGContextSetLineWidth(context, lineWidth);
    
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);
    CGContextAddLineToPoint(context,rect.origin.x+rect.size.width, rect.origin.y+rect.size.height);
    CGContextStrokePath(context);
    
    
    CGContextRestoreGState(context);
    
}


+ (void)drawRect:(CGRect)rect fill:(const CGFloat*)fillColors radius:(CGFloat)radius {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    
    if (fillColors) {
        CGContextSaveGState(context);
        CGContextSetFillColor(context, fillColors);
        if (radius) {
            UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
            CGContextAddPath(context, path.CGPath);
            CGContextFillPath(context);
        } else {
            CGContextFillRect(context, rect);
        }
        CGContextRestoreGState(context);
    }
    
    CGColorSpaceRelease(space);
}

+ (void)drawRect:(CGRect)rect fillColor:(UIColor *)fillColor radius:(CGFloat)radius {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    
    if (fillColor) {
        CGContextSaveGState(context);
        const CGFloat* components = CGColorGetComponents(fillColor.CGColor);
        CGContextSetRGBFillColor(context, components[0], components[1], components[2], components[3]);
        if (radius) {
            UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
            CGContextAddPath(context, path.CGPath);
            CGContextFillPath(context);
        } else {
            CGContextFillRect(context, rect);
        }
        CGContextRestoreGState(context);
    }
    
    CGColorSpaceRelease(space);
}

+ (void)strokeLines:(CGRect)rect stroke:(const CGFloat*)strokeColor {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    
    CGContextSaveGState(context);
    CGContextSetStrokeColorSpace(context, space);
    CGContextSetStrokeColor(context, strokeColor);
    CGContextSetLineWidth(context, 1.0);
    
    {
        CGPoint points[] = {{rect.origin.x+0.5, rect.origin.y-0.5},
            {rect.origin.x+rect.size.width, rect.origin.y-0.5}};
        CGContextStrokeLineSegments(context, points, 2);
    }
    {
        CGPoint points[] = {{rect.origin.x+0.5, rect.origin.y+rect.size.height-0.5},
            {rect.origin.x+rect.size.width-0.5, rect.origin.y+rect.size.height-0.5}};
        CGContextStrokeLineSegments(context, points, 2);
    }
    {
        CGPoint points[] = {{rect.origin.x+rect.size.width-0.5, rect.origin.y},
            {rect.origin.x+rect.size.width-0.5, rect.origin.y+rect.size.height}};
        CGContextStrokeLineSegments(context, points, 2);
    }
    {
        CGPoint points[] = {{rect.origin.x+0.5, rect.origin.y},
            {rect.origin.x+0.5, rect.origin.y+rect.size.height}};
        CGContextStrokeLineSegments(context, points, 2);
    }
    
    CGContextRestoreGState(context);
    
    CGColorSpaceRelease(space);
}








- (UIActivityIndicatorView *) activityWithOrigin:(CGPoint)pt {
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.hidesWhenStopped = YES;
    [self addSubview:activityView];
    activityView.frame = CGRectMake(0.0, 0.0, 20.0f, 20.0f);
    
    CGRect rect = activityView.frame;
    rect.origin = pt;
    activityView.frame = rect;
    
    [self bringSubviewToFront:activityView];
#if __has_feature(objc_arc)
    return activityView;
#else
    return [activityView autorelease];
#endif
}



- (UIActivityIndicatorView *) activityAtCenterWithSize:(CGSize)size {
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = CGSizeMake(20.0f, 20.0f);
    }
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.hidesWhenStopped = YES;
    [self addSubview:activityView];
    activityView.frame = CGRectMake(0.0, 0.0, size.width, size.height);
    
    CGRect rect = activityView.frame;
    rect.origin = CGPointMake((CGRectGetWidth(self.frame)-size.width)/2, (CGRectGetHeight(self.frame)-size.height)/2);
    activityView.frame = rect;
    
    [self bringSubviewToFront:activityView];
#if __has_feature(objc_arc)
    return activityView;
#else
    return [activityView autorelease];
#endif
}


- (UIActivityIndicatorView *) activityAtCenter {
    UIActivityIndicatorView *activityView = (UIActivityIndicatorView *)[self viewWithTag:kActivityTag];
    if (!activityView) {
        activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
#if __has_feature(objc_arc)
#else
        [activityView autorelease];
#endif
        activityView.hidesWhenStopped = YES;
        activityView.tag = kActivityTag;
        [self addSubview:activityView];
    }
    
    activityView.frame = CGRectMake(0.0, 0.0, 20.0f, 20.0f);
    CGRect rect = activityView.frame;
    rect.origin = CGPointMake((CGRectGetWidth(self.frame)-20)/2, (CGRectGetHeight(self.frame)-20)/2);
    activityView.frame = rect;
    [self bringSubviewToFront:activityView];
    
    return activityView;
}


-(void)removeAllSubViews{
    
    for( UIView *v in [self subviews]){
        [v removeFromSuperview];
    }
}

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}



@end
