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

+ (NSArray<NSString *> *)mtFilterFontFilesWithBundle:(NSBundle *)fontBundle fileTypes:(NSArray<NSString *>*)typeArr includeDefaultType:(BOOL)includeFlag {
    NSMutableArray<NSString *> * pathes = [NSMutableArray new];
    
    NSMutableSet<NSString *> *typeUse = [NSMutableSet new];
    [typeUse addObjectsFromArray:typeArr];
    
    if (includeFlag == YES) {
        [typeUse addObjectsFromArray:@[@"ttf", @"tif"]];
    }
    
    [typeUse enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        NSArray<NSString *> *pathArr = [fontBundle pathsForResourcesOfType:obj inDirectory:nil];
        [pathes addObjectsFromArray:pathArr];
    }];
    
    return pathes;
}

+ (NSArray<NSString *> *)mtLoadFontWithBundle:(NSBundle *)fontBundle fileTypes:(NSArray<NSString *>*)typeArr includeDefaultType:(BOOL)includeFlag error:(NSError *_Nullable *_Nullable)err {
    NSArray<NSString *> * pathes = [self mtFilterFontFilesWithBundle:fontBundle fileTypes:typeArr includeDefaultType:includeFlag];
    
    NSMutableArray<NSString *> *fontNames = [NSMutableArray new];
    NSMutableArray<NSString *> *errMsgs = [NSMutableArray new];
    [pathes enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSError *err = nil;
       NSString * oneName = [self mtLoadFontsWithFilePath:obj err:&err];
        if (err) {
            NSString *msg = err.userInfo[NSLocalizedDescriptionKey];
            msg.length > 0 ? [errMsgs addObject:msg] : 0;
        } else {
            if (oneName.length) {
                [fontNames addObject:oneName];
            }
        }
    }];
    
    if (errMsgs.count > 0 && err) {
        NSMutableString *ms = [NSMutableString new];
        [errMsgs enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [ms appendString:obj];
            [ms appendString:@"\n"];
        }];
       *err = [self createError:ms];
    }
    
    NSLog(@"font pathes:%@", pathes);
    NSLog(@"font names:%@", fontNames);
    return fontNames;
}
@end
