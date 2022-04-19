//
//  UIBarButtonItem+Extension.h
//  DGPassenger
//
//  Created by Tom on 2021/10/10.
//  Copyright © 2021 Tom.Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)mt_itemWithimage:(UIImage *)image   target:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
