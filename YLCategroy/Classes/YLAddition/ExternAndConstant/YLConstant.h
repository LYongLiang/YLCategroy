//
//  YLConstant.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#ifndef YLConstant_h
#define YLConstant_h


#ifdef DEBUG
#define NSLog(format, ...) printf("[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif


#ifdef DEBUG  // 调试状态
// 打开LOG功能
#define YLLog(...) NSLog(__VA_ARGS__)
// 打开断言功能
#define YLAssert(condition, desc) NSAssert(condition, @"\n报错文件：%@\n报错行数：第%d行\n报错方法：%s\n错误描述：%@", [NSString stringWithUTF8String:__FILE__], __LINE__,  __FUNCTION__, desc)
#define YLAssertParamNotNil(param) YLAssert(param, [[NSString stringWithFormat:@#param] stringByAppendingString:@"参数不能为nil"])
#else // 发布状态
// 关闭LOG功能
#define YLLog(...)
// 关闭断言功能x
#define YLAssert(condition, desc)
#define YLAssertParamNotNil(param)
#endif

#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS8_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define IOS6_OR_PRIOR   ( [[[UIDevice currentDevice] systemVersion] compare:@"6.9"] != NSOrderedDescending )
#define IOS6_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS6   ( [[[UIDevice currentDevice] systemVersion] rangeOfString:@"6."].length > 0 )

// 判断是否为iphone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


//app当前版本号
#define CurrentVersionString [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]



// 应用程序的frame
#define APPLICATIONFRAME [[UIScreen mainScreen] bounds]
//屏幕大小
#define Screen_Width [[UIScreen mainScreen] bounds].size.width
#define Screen_Height [[UIScreen mainScreen] bounds].size.height

#define Screen_Scale ((Screen_Width<Screen_Height?Screen_Width:Screen_Height)/375.0)

#define kRect(x,y,width,height) CGRectMake((x)*Screen_Scale,(y)*Screen_Scale,(width)*Screen_Scale,(height)*Screen_Scale)


//window
#define kWINDOW [[UIApplication sharedApplication].delegate window]


//iPhoneX适配  横竖屏时候的比较
#define k_iPhoneX  (MIN(Screen_Width,Screen_Height) == 375 && MAX(Screen_Width,Screen_Height) == 812 ? YES:NO)

#define k_NavBarHeight  (k_iPhoneX ? 88:64)



//userDefault
#define kUSERDEFAULT  [NSUserDefaults standardUserDefaults]


//颜色
// RGB转换成UIColor
#define YLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 随机色
#define YLRandomColor YLColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
//十六进制转换成UIColor
#define YLHex2Rgb(hexValue) [UIColor colorWithRed:((hexValue & 0xFF0000) >> 16)/255.0 green:((hexValue & 0xFF00) >> 8)/255.0 blue:((hexValue & 0xFF))/255.0 alpha:1.0]




#endif /* YLConstant_h */
