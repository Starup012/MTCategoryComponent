//
//  UIBarButtonItem+Extension.m
//  DGPassenger
//
//  Created by Tom on 2021/10/10.
//  Copyright © 2021 Tom.Liu. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)mt_itemWithimage:(UIImage *)image   target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(0, 0, 44, 44)];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
