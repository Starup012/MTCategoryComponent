//
//  NSObject+ProgessHUD.m
//  MTCategoryComponent
//
//  Created by Tom.Liu on 2022/2/20.
//

#import "NSObject+ProgessHUD.h"
#import "MTUIViewControllerExtensionHeader.h"

@implementation NSObject (ProgessHUD)

- (void)mt_toastTip:(NSString*)tip {
    [self  mt_toastTip:tip hideDelay:1.5];
    
}

- (void)mt_toastTip:(NSString*)tip hideDelay:(NSTimeInterval)delay {
    [[UIViewController mt_topViewController] mt_toastMessage:tip duration:delay];

}

- (void)mt_showHUD {
    [[UIViewController mt_topViewController] mt_showHUD];
}

- (void)mt_hideHUD {
    [[UIViewController mt_topViewController] mt_hideHUD];
}

@end
