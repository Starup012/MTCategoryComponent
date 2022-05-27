//
//  UIFont+MTExtension.m
//  MTCategoryComponent
//
//  Created by stephen.chen on 2022/5/27.
//

#import "UIFont+MTExtension.h"

#import <CoreText/CoreText.h>

@implementation UIFont (MTExtension)
+ (NSError *)createError:(NSString *)reason {
#ifdef DEBUG
    NSLog(@"Regist font error:%@", reason);
#endif
    return [NSError errorWithDomain:NSCocoaErrorDomain code:0 userInfo:@{
        NSLocalizedFailureReasonErrorKey: reason,
        NSLocalizedDescriptionKey: reason,
    }];
}

+ (NSString * __nullable)mtLoadFontsWithFilePath:(NSString *)filePath err:(NSError * _Nullable *_Nullable)err {
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath] == NO){
        if (err) *err = [self createError:[NSString stringWithFormat:@"Font file is not existed: %@", filePath]];
        return nil;
    }
    
    CGDataProviderRef provider = CGDataProviderCreateWithFilename([filePath cStringUsingEncoding:NSUTF8StringEncoding]);
    if (provider == nil) {
        if (err) *err = [self createError:[NSString stringWithFormat:@"Font provider create failed: %@", filePath]];
        return nil;
    }
    
    CGFontRef font = CGFontCreateWithDataProvider(provider);
    if (font == nil) {
        if (err) *err = [self createError:[NSString stringWithFormat:@"Font analysis failed: %@", filePath]];
        return nil;
    }
    
    CFErrorRef errCF;
    bool registResult = CTFontManagerRegisterGraphicsFont(font, &errCF);
    if (registResult != true) { //注册失败， 尝试先取消，在注册
        CTFontManagerUnregisterGraphicsFont(font, &errCF);
        registResult = CTFontManagerRegisterGraphicsFont(font, &errCF);
    }
    
    if (registResult != true) { //注册失败
        if (err) *err = [self createError:[NSString stringWithFormat:@"Regist font failed: %@", filePath]];
        return nil;
    }
    
    CFStringRef fontNameCF = CGFontCopyPostScriptName(font);
    NSString * fontName = CFBridgingRelease(fontNameCF);
    CGFontRelease(font);
    CGDataProviderRelease(provider);
    
    return fontName;
}
@end
