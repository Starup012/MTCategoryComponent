//
//  UIImage+UIImage.m
//  ShellProject
//
//  Created by Tom.Liu on 02/22/2021.
//  Copyright (c) 2021 Tom.Liu. All rights reserved.
//

#import "UIImage+Custom.h"
#import <objc/runtime.h>

@implementation UIImage (Custom)
 
- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
  NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
  return [UIImage imageWithData:data];
}


- (UIImage*)transformWidth:(CGFloat)width
                    height:(CGFloat)height {
    
    CGFloat destW = width;
    CGFloat destH = height;
    CGFloat sourceW = width;
    CGFloat sourceH = height;
    
    CGImageRef imageRef = self.CGImage;
    
    
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                destW,
                                                destH,
                                                CGImageGetBitsPerComponent(imageRef),
                                                4*destW,
                                                CGImageGetColorSpace(imageRef),
                                                (kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, sourceW, sourceH), imageRef);
    
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage *result = [UIImage imageWithCGImage:ref];
    CGContextRelease(bitmap);
    CGImageRelease(ref);
    
    return result;
}

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

- (UIImage *)scaleWithSize:(CGSize)size
{
    return [self scaleWithWidth:size.width height:size.height];
}

- (UIImage *)scaleWithWidth:(CGFloat)width height:(CGFloat)height
{
    CGFloat destW = width;
    CGFloat destH = height;
    CGFloat sourceW = width;
    CGFloat sourceH = height;
    
    CGImageRef imageRef = self.CGImage;
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                destW,
                                                destH,
                                                CGImageGetBitsPerComponent(imageRef),
                                                4*destW,
                                                CGImageGetColorSpace(imageRef),
                                                (kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, sourceW, sourceH), imageRef);
    
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage *result = [UIImage imageWithCGImage:ref];
    CGContextRelease(bitmap);
    CGImageRelease(ref);
    
    return result;
}




+ (UIImage *)captureImage:(UIImage *)image rect:(CGRect)rect
{
    if (!image) {
        return nil;
    }
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    CFAutorelease(imageRef);
    if (imageRef == NULL) {
        return nil;
    }
    return [UIImage imageWithCGImage:imageRef];
}

- (UIImage *)imageByCaptureRect:(CGRect)rect;
{
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CFAutorelease(imageRef);
    return [UIImage imageWithCGImage:imageRef];
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage*)imageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
}
+ (UIImage*)imageWithCircleColor:(UIColor*)color{
    
    CGRect rect=CGRectMake(0.0f, 0.0f, 10.0f, 10.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3.0);//线的宽度
    CGContextAddArc(context, 250, 40, 40, 5, 2*M_PI, 0); //添加一个圆
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillEllipseInRect(context,rect);
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (UIImage *)imageStrokeWithColor:(UIColor *)strokeColor size:(CGSize)size{
    CGFloat width = MIN(size.width, size.height);
    
    CGRect rect = CGRectMake(0, 0, width, width);
    UIGraphicsBeginImageContext(rect.size);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width/2, width/2) radius:width/2-0.5 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    path.lineWidth = 1;
    [strokeColor setStroke];
    [path stroke];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UIImage *)imageByApplyingAlpha:(CGFloat )alpha{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, area, self.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

- (CGFloat)width
{
    return self.size.width;
}

- (CGFloat)height
{
    return self.size.height;
}

+(UIImage *)scaleImage:(UIImage *)image toKb:(NSInteger)kb{
    
    if (!image) {
        return image;
    }
    if (kb<1) {
        return image;
    }
    
    kb*=1000;
    
    
    
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > kb && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    NSLog(@"当前大小:%fkb",(float)[imageData length]/1000.0f);
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
    
    
    
}

/**
 *  压缩图片到指定尺寸大小
 *
 *  @param img 原始图片
 *  @param sizeKB  目标大小kb
 *
 *  @return 生成图片
 */
+ (UIImage *)drawImgWithOriangeImg:(UIImage *)img withMaxSize:(NSInteger)sizeKB{
    
    UIImage *image = img;
    
    UIImage *destImg = image;
    
    NSData *imgData = UIImagePNGRepresentation(image);
    
    NSInteger imgSize = [imgData length]/1000;
    
//    NSLog(@"原图片尺寸:%ldKB",imgSize);
    
    if (imgSize > sizeKB *1000) {
        
        NSInteger ratio = ceil(((double)imgSize)/(sizeKB *1000));
        
        CGSize newSize = CGSizeMake(image.size.width/ratio, image.size.height/ratio);
        
        UIGraphicsBeginImageContext(newSize);
        
        [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        
        destImg = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
    }
    
    return destImg;
    
}

- (UIImage *)imageWithBriIncrement:(CGFloat)briIncrement {
    
    CIFilter *filter = [self imageFilter];
    
    NSNumber *curBri = [filter valueForKey:@"inputBrightness"];
    [filter setValue:@(curBri.floatValue + briIncrement) forKey:@"inputBrightness"];
    
    return [self applyFileter:filter];
}

- (UIImage *)imageWithSatIncrement:(CGFloat)satIncrsement {
    
    CIFilter *filter = [self imageFilter];
    
    NSNumber *curSat = [filter valueForKey:@"inputSaturation"];
    [filter setValue:@(curSat.floatValue + satIncrsement) forKey:@"inputSaturation"];
    
    return [self applyFileter:filter];
}

- (UIImage *)imageWithContrastIncrement:(CGFloat)conIncrement {
    
    CIFilter *filter = [self imageFilter];
    
    NSNumber *curCon = [filter valueForKey:@"inputContrast"];
    [filter setValue:@(curCon.floatValue + conIncrement) forKey:@"inputContrast"];
    
    return [self applyFileter:filter];
}

- (CIFilter *)imageFilter {
    CIImage *ciImg = [CIImage imageWithCGImage:self.CGImage];
    CIFilter *lighten = [CIFilter filterWithName:@"CIColorControls"];
    [lighten setValue:ciImg forKey:kCIInputImageKey];
    return lighten;
}

- (UIImage *)applyFileter:(CIFilter *)filter {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *ciResult = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:ciResult fromRect:[[CIImage imageWithCGImage:self.CGImage] extent]];
    UIImage *uiResult = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return [UIImage imageWithData:UIImagePNGRepresentation(uiResult) scale:[UIScreen mainScreen].scale];
}

-(NSData *)compressWithLengthLimit:(NSUInteger)maxLength{
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(self, compression);
    //NSLog(@"Before compressing quality, image size = %ld KB",data.length/1024);
    if (data.length < maxLength) return data;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(self, compression);
        //NSLog(@"Compression = %.1f", compression);
        //NSLog(@"In compressing quality loop, image size = %ld KB", data.length / 1024);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    //NSLog(@"After compressing quality, image size = %ld KB", data.length / 1024);
    if (data.length < maxLength) return data;
    UIImage *resultImage = [UIImage imageWithData:data];
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        //NSLog(@"Ratio = %.1f", ratio);
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
        //NSLog(@"In compressing size loop, image size = %ld KB", data.length / 1024);
    }
    //NSLog(@"After compressing size loop, image size = %ld KB", data.length / 1024);
    return data;
}

+ (UIImage *)imageWithSize:(CGSize)size leftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor {
    //创建CGContextRef
    UIGraphicsBeginImageContext(size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    //绘制Path
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, size.width, size.height)];
    //绘制渐变
    [self drawLinearGradient:gc path:path.CGPath startColor:leftColor.CGColor endColor:rightColor.CGColor];
    // 从 Context 中获取图像
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (void)drawLinearGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor {
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    //具体方向可根据需求修改
    CGPoint startPoint = CGPointMake(CGRectGetMinX(pathRect), CGRectGetMidY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMidY(pathRect));
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

- (void)saveToAlbum {
    [self saveToAlbumComplete:nil];
}
- (void)saveToAlbumComplete:(void(^)(BOOL isSuccess))complete{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self];
    imageView.frame = CGRectMake(0, 0, self.size.width, self.size.height);
    UIWindow *win = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    win.windowLevel = UIWindowLevelNormal - 2;
    [win addSubview:imageView];
    [win makeKeyAndVisible];
    
    UIGraphicsBeginImageContextWithOptions(imageView.frame.size, NO, 0.0);
    [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *savingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(savingImage, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
    objc_setAssociatedObject(self, "saveToAlbumComplete:", complete, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)info {
    id block = objc_getAssociatedObject(self, "saveToAlbumComplete:");
    if (block) {
        void(^complete)(BOOL) = block;
        complete(!error);
    }
    if (!error) {
        [[[UIAlertView alloc] initWithTitle:@"保存成功" message:@"成功保存到相册" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
    }else {
        [[[UIAlertView alloc] initWithTitle:@"保存失败" message:@"请开启相册权限" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
    }
}


+ (UIImage*)ys_imageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
}


@end
