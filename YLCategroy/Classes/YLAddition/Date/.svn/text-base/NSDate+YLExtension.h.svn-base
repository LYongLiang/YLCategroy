//
//  NSDate+YLExtension.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CURRENT_CALENDAR [NSCalendar currentCalendar]


@interface NSDate (YLExtension)

+ (BOOL)compareOneTimeIsNew:(NSString *)oneTime nextTime:(NSString *)nextTime;

//该月有几天
- (NSInteger)getDayNumOfMonth;
//该月跨几周
- (NSInteger )getWeekNumOfMonth;
//该年有几周
- (NSInteger )getWeekOfYear;
//返回day天后的日期
- (NSDate *)dateAfterDay:(NSInteger)day;
//返回mouth月后的日期
- (NSDate *)dateAfterMonth:(NSInteger)month;


//获取当前日期 天  月  年  小时  分钟  秒
- (NSInteger)getDay;
- (NSInteger)getMonth;
- (NSInteger)getYear;
- (NSInteger )getHour;
- (NSInteger )getMinute;
- (NSInteger)getSecond;



//根据年月日生成日期对象
+ (NSDate *)dateFromYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day;
+ (NSDate *)dateFromString:(NSString *)string;//@"yyyy-MM-dd HH:mm:ss"
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)string;
+ (NSString *)stringFromDate:(NSDate *)date; //2015-11-25 17:13:27
+ (NSString *)stringForDisplayFromDate:(NSDate *)date; //5:14 PM
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed;//YES : at 5:15 PM  NO:5:14 PM

- (NSString *)string;//2015-11-25 17:16:34
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;



//返回周日的的开始时间
- (NSDate *)beginningOfWeek;
- (NSDate *)beginningOfMonth;
- (NSDate *)endOfMonth;
- (NSDate *)beginningOfDay;
- (NSDate *)endOfWeek;

+ (NSString *)dateFormatString;//yyyy-MM-dd
+ (NSString *)timeFormatString;//HH:mm:ss
+ (NSString *)timestampFormatString;//yyyy-MM-dd HH:mm:ss
+ (NSString *)dbFormatString;//yyyy-MM-dd HH:mm:ss

- (NSString *)dateStringForYearMonthDay;//@“2012-12-12”



//- (NSInteger)daysAgo;
//- (NSInteger)daysAgoAgainstMidnight;
//- (NSString *)stringDaysAgo;
//- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag;
////返回周几。周日是第一天
//- (NSInteger)weekday;

@end
