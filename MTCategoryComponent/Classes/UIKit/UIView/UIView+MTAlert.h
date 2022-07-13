//
//  UIView+MTAlert.h
//  MTCategoryComponent
//
//  Created by stephen.chen on 2022/7/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MTAlert)
- (void)mtShowAlertToView:(UIView *)view backColor:(UIColor * _Nullable)backColor enableDismiss:(BOOL)enableDismiss layingAction:(void(^)(UIView *backV, UIView *alertSelf))layingAction;
- (void)mtDismissAlertShowing;
@end

NS_ASSUME_NONNULL_END
