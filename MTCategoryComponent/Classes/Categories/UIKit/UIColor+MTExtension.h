///**
/**
Categoties
Created by: Tom.Liu on 2021/1/8
Github : https://github.com/lyleLH

 	 * ⣿⣿⣿⣿⣿⣿⢟⣡⣴⣶⣶⣦⣌⡛⠟⣋⣩⣬⣭⣭⡛⢿⣿⣿⣿⣿
	 * ⣿⣿⣿⣿⠋⢰⣿⣿⠿⣛⣛⣙⣛⠻⢆⢻⣿⠿⠿⠿⣿⡄⠻⣿⣿⣿ 
	 * ⣿⣿⣿⠃⢠⣿⣿⣶⣿⣿⡿⠿⢟⣛⣒⠐⠲⣶⡶⠿⠶⠶⠦⠄⠙⢿ 
	 * ⣿⠋⣠⠄⣿⣿⣿⠟⡛⢅⣠⡵⡐⠲⣶⣶⣥⡠⣤⣵⠆⠄⠰⣦⣤⡀ 
	 * ⠇⣰⣿⣼⣿⣿⣧⣤⡸⢿⣿⡀⠂⠁⣸⣿⣿⣿⣿⣇⠄⠈⢀⣿⣿⠿ 
	 * ⣰⣿⣿⣿⣿⣿⣿⣿⣷⣤⣈⣙⠶⢾⠭⢉⣁⣴⢯⣭⣵⣶⠾⠓⢀⣴
	 * ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣉⣤⣴⣾⣿⣿⣦⣄⣤⣤⣄⠄⢿⣿
	 * ⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠈⢿
	 * ⣿⣿⣿⣿⣿⣿⡟⣰⣞⣛⡒⢒⠤⠦⢬⣉⣉⣉⣉⣉⣉⣉⡥⠴⠂⢸
	 * ⠻⣿⣿⣿⣿⣏⠻⢌⣉⣉⣩⣉⡛⣛⠒⠶⠶⠶⠶⠶⠶⠶⠶⠂⣸⣿
	 * ⣥⣈⠙⡻⠿⠿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⠿⠛⢉⣠⣶⣶⣿⣿
	 * ⣿⣿⣿⣶⣬⣅⣒⣒⡂⠈⠭⠭⠭⠭⠭⢉⣁⣄⡀⢾⣿⣿⣿⣿⣿⣿

*/

#import <UIKit/UIKit.h>
#import "UIImage+MTExtension.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIColor (MTExtension)

///
+ (NSArray * )mt_randomPairColorForRead ;

/// hex字符串返回UIcolor
/// @param hexString @"#1abc9c"],@"1abc9c"],@"#1ABC9C"]，不区分大小写自动过滤'#'

+ (UIColor *)mt_colorFromHexString:(NSString *)hexString ;

+ (UIColor *)mt_randomColor;

/// hex值返回UIcolor
/// @param hexValue 0x666666
+ (UIColor *)mt_colorWithHex:(int)hexValue;


/// hex值返回UIcolor
/// @param hexValue  0x666666
/// @param alpha 0～1.0
+ (UIColor *)mt_colorWithHex:(int)hexValue alpha:(CGFloat)alpha;

+ (UIColor *)mt_colorRGB:(CGFloat)R g:(CGFloat)G b:(CGFloat)B;

+ (UIColor *)mt_colorRGBA:(CGFloat)R g:(CGFloat)G b:(CGFloat)B A:(CGFloat)alpha;

#pragma mark -- App颜色配置

/// 主题渐变色
+ (UIColor *)mt_gradientColor ;
/// 主题颜色
+ (UIColor *)mt_themeColor;

/// 按钮主题色 渐变   ，左边的颜色
+ (UIColor *)mt_themeGradientLeftColor;


/// 按钮主题色 渐变  ，右边的颜色
+ (UIColor *)mt_themeGradientRightColor;


/// 主题色按钮 禁用状态的颜色 渐变   ，左边的颜色
+ (UIColor *)mt_themeDisabledGradientLeftColor;


/// 主题色按钮 禁用状态的颜色 渐变   ，右边的颜色
+ (UIColor *)mt_themeDisabledGradientRightColor;



/// 白色背景上的 禁用文字的颜色
+ (UIColor *)mt_disabledInWhiteBgTextColor;


/// 白色背景上的 文字颜色
+ (UIColor *)mt_normalInWhiteBgTextColor;



/// 白色背景上的 分割线颜色
+ (UIColor *)mt_normalInWhiteBgseparateLineColor;


/// 文字颜色为主题色的 按钮的 背景颜色
+ (UIColor *)mt_lightBlueBgColor ;


/// 文字颜色为黑色 列表cell 的 背景颜色
+ (UIColor *)mt_lightGrayBlueBgColor;

/// 列表的背景色
+ (UIColor *)mt_commonViewBgColor;
#pragma  mark -- 收款页面数字键盘 相关的颜色


/// 普通数字按钮的背景颜色
+ (UIColor *)mt_numpadNumbersBackgroundColor ;

/// 删除、清除按钮的背景颜色
+ (UIColor *)mt_numpadFunctionsBackgroundColor;


@end

NS_ASSUME_NONNULL_END
