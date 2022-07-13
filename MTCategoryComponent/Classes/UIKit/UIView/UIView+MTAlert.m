//
//  UIView+MTAlert.m
//  MTCategoryComponent
//
//  Created by stephen.chen on 2022/7/13.
//

#import "UIView+MTAlert.h"

#import <Masonry/Masonry.h>

@interface MTPriAlertBackV: UIButton
@property (nonatomic, weak) UIView *alertContenV; ///< 承载图
@end

@implementation MTPriAlertBackV
@end

@implementation UIView (MTAlert)
- (void)mtShowAlertToView:(UIView *)view backColor:(UIColor * _Nullable)backColor enableDismiss:(BOOL)enableDismiss layingAction:(void(^)(UIView *backV, UIView *alertSelf))layingAction {
    if (view == nil) {
        NSLog(@"MTDebug: %s -- view == nil", __func__);
        return;
    }
    
    MTPriAlertBackV *bacV = [MTPriAlertBackV buttonWithType:UIButtonTypeCustom];
    if (enableDismiss) {
        [bacV addTarget:self action:@selector(backvTouchAction:) forControlEvents:UIControlEventTouchUpInside];
    }

    [view addSubview:bacV];
    [bacV addSubview:self];
    bacV.alertContenV = self;
    
    if (backColor != nil) {
        bacV.backgroundColor = backColor;
    } else {
        bacV.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }
    
    [bacV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    if (layingAction) {
        layingAction(bacV, self);
    }  
}

- (void)backvTouchAction:(UIButton *)sender {
    [sender removeTarget:nil action:nil forControlEvents:UIControlEventAllEvents];
    [sender removeFromSuperview];
}

- (void)mtDismissAlertShowing {
    if ([self.superview isKindOfClass:MTPriAlertBackV.class]) {
        MTPriAlertBackV *back = (MTPriAlertBackV *)self.superview;
        [back removeTarget:nil action:nil forControlEvents:UIControlEventAllEvents];
        [back removeFromSuperview];
    }
}
@end
