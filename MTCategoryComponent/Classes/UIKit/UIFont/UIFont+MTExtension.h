//
//  UIFont+MTExtension.h
//  MTCategoryComponent
//
//  Created by stephen.chen on 2022/5/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (MTExtension)

/**
 筛选font文件
 
 @discussion 筛选制定bundle下所有匹配固定扩展名的font文件;
 
 @param fontBundle 目标bundle
 @param typeArr 扩展名数组 tff, tif 等
 @param includeFlag 是否使用默认类型 底层默认指定了 tff, tif 类型
 
 @return 识别到的font文件的绝对路径数组， 如果没有识别到，则数组为空
 */
+ (NSArray<NSString *> *)mtFilterFontFilesWithBundle:(NSBundle *)fontBundle fileTypes:(NSArray<NSString *>*)typeArr includeDefaultType:(BOOL)includeFlag;

/**
 加载一个font文件
 
 @discussion 通过font文件绝对路径，加载一个font文件
 
 @param filePath 文件路径
 @param err 加载失败的回调
 
 @return font的名字
 */
+ (NSString * __nullable)mtLoadFontsWithFilePath:(NSString *)filePath err:(NSError * _Nullable *_Nullable)err;

/**
 加载多个font文件
 
 @discussion 加载指定bundle下的所有匹配固定扩展名称的font文件; 此方法err只是用于
 
 @param fontBundle font文件所处的bundle
 @param typeArr 扩展名数组 tff, tif 等
 @param includeFlag 是否使用默认类型 底层默认指定了 tff, tif 类型
 @param err 加载错误的回调， err只适合用于调试代码， 如果某一个font文件失败，则err就不会为空
 
 @return 加载成功的font的名字
 */
+ (NSArray<NSString *> *)mtLoadFontWithBundle:(NSBundle *)fontBundle fileTypes:(NSArray<NSString *>* _Nullable )typeArr includeDefaultType:(BOOL)includeFlag error:(NSError *_Nullable *_Nullable)err;
@end

NS_ASSUME_NONNULL_END
