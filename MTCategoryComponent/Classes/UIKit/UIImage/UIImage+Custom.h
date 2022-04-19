//
//  UIImage+UIImage.m
//  ShellProject
//
//  Created by Tom.Liu on 02/22/2021.
//  Copyright (c) 2021 Tom.Liu. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIImage (Custom)
 
- (UIImage *)transformWidth:(CGFloat)width height:(CGFloat)height;
/*!
 * 拉伸图片
 */
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

/*!
 * 改变图片的长和宽
 */
- (UIImage *)scaleWithWidth:(CGFloat)width height:(CGFloat)height;
- (UIImage *)scaleWithSize:(CGSize)size;

/*!
 * 切割图片
 */
+ (UIImage *)captureImage:(UIImage *)image rect:(CGRect)rect;
- (UIImage *)imageByCaptureRect:(CGRect)rect;
- (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor*)color;
+ (UIImage*)imageWithCircleColor:(UIColor*)color;
+ (UIImage *)imageStrokeWithColor:(UIColor *)strokeColor size:(CGSize)size;

- (UIImage *)imageByApplyingAlpha:(CGFloat )alpha;

- (CGFloat)width;
- (CGFloat)height;

+ (UIImage *)scaleImage:(UIImage *)image toKb:(NSInteger)kb;
+ (UIImage *)drawImgWithOriangeImg:(UIImage *)img withMaxSize:(NSInteger)sizeKB;

- (UIImage *)imageWithBriIncrement:(CGFloat)briIncrement;
- (UIImage *)imageWithSatIncrement:(CGFloat)satIncrsement;
- (UIImage *)imageWithContrastIncrement:(CGFloat)conIncrement;
-(NSData *)compressWithLengthLimit:(NSUInteger)maxLength;

+ (UIImage *)imageWithSize:(CGSize)size leftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor;

- (void)saveToAlbum;
- (void)saveToAlbumComplete:(void(^)(BOOL isSuccess))complete;
+ (UIImage*)ys_imageWithColor:(UIColor*)color;
@end
