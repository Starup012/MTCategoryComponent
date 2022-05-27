//
//  UIFont+MTExtension.h
//  MTCategoryComponent
//
//  Created by stephen.chen on 2022/5/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (MTExtension)
+ (NSString * __nullable)mtLoadFontsWithFilePath:(NSString *)filePath err:(NSError * _Nullable *_Nullable)err;
@end

NS_ASSUME_NONNULL_END
