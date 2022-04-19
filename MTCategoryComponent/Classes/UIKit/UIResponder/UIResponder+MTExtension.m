//
//  UIResponder+MTExtension.m
//  MTCategoryComponent
//
//  Created by Tom.Liu on 2021/6/18.
//

#import "UIResponder+MTExtension.h"
#import <objc/runtime.h>

static void *kNextResponderKey = "com.tom.NextResponderKey";

@implementation UIResponder (MTExtension)
-(void)mt_passEventName:(NSString *)eventName fromObject:(id )obj withUserInfo:(NSDictionary *)userInfo {
    [[self nextResponder] mt_passEventName:eventName fromObject:obj withUserInfo:userInfo];
}


- (void)setNr_eventDelegate:(id)nr_eventDelegate {
    objc_setAssociatedObject(self, kNextResponderKey, nr_eventDelegate, OBJC_ASSOCIATION_ASSIGN);
}


- (id)nr_eventDelegate {
    return objc_getAssociatedObject(self, kNextResponderKey);
}


@end
