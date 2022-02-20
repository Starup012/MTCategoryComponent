//
//  NSObject+ProgessHUD.h
//  MTCategoryComponent
//
//  Created by Tom.Liu on 2022/2/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ProgessHUD)

- (void)mt_toastTip:(NSString*)tip;

- (void)mt_toastTip:(NSString*)tip hideDelay:(NSTimeInterval)delay;

- (void)mt_showHUD;

- (void)mt_hideHUD;

@end

NS_ASSUME_NONNULL_END
