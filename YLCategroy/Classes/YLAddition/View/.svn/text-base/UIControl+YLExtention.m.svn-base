//
//  UIControl+YLExtention.m
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import "UIControl+YLExtention.h"
#import <objc/runtime.h>


static const char * UIControl_acceptEventTimeInterval = "UIControl_acceptEventTimeInterval";
static const char * UIControl_ignoreEvent = "UIControl_ignoreEvent";
@interface UIControl ()
@property (nonatomic, assign) BOOL ignoreEvent;
@end

@implementation UIControl (YLExtention)

//hook
+ (void)load
{
    //a = (Method)0x0
    //b = (Method)0x0
    //类方法用此方法
    //    Method a = class_getClassMethod(self, @selector(sendAction:to:forEvent:));
    //    Method b = class_getClassMethod(self, @selector(m_sendAction:to:forEvent:));
    //查找父类方法
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(m_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

//runtime
- (NSTimeInterval)acceptEventTimeInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventTimeInterval) doubleValue];
}

- (void)setAcceptEventTimeInterval:(NSTimeInterval)acceptEventTimeInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventTimeInterval, @(acceptEventTimeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)ignoreEvent
{
    return [objc_getAssociatedObject(self, UIControl_ignoreEvent) boolValue];
}

- (void)setIgnoreEvent:(BOOL)ignoreEvent
{
    objc_setAssociatedObject(self, UIControl_ignoreEvent, @(ignoreEvent), OBJC_ASSOCIATION_ASSIGN);
}

- (void)m_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.ignoreEvent) { return; }
    if (self.acceptEventTimeInterval > 0) {
        self.ignoreEvent = YES;
        [self performSelector:@selector(setIgnoreEvent:) withObject:@(NO) afterDelay:self.acceptEventTimeInterval];
    }
    [self m_sendAction:action to:target forEvent:event];
}


@end
