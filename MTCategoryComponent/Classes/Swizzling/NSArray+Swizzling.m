///**
/**
Categoties
Created by: Tom.Liu on 2021/1/4
Github : https://github.com/lyleLH

 	 * ⣿⣿⣿⣿⣿⣿⢟⣡⣴⣶⣶⣦⣌⡛⠟⣋⣩⣬⣭⣭⡛⢿⣿⣿⣿⣿
	 * ⣿⣿⣿⣿⠋⢰⣿⣿⠿⣛⣛⣙⣛⠻⢆⢻⣿⠿⠿⠿⣿⡄⠻⣿⣿⣿ 
	 * ⣿⣿⣿⠃⢠⣿⣿⣶⣿⣿⡿⠿⢟⣛⣒⠐⠲⣶⡶⠿⠶⠶⠦⠄⠙⢿ 
	 * ⣿⠋⣠⠄⣿⣿⣿⠟⡛⢅⣠⡵⡐⠲⣶⣶⣥⡠⣤⣵⠆⠄⠰⣦⣤⡀ 
	 * ⠇⣰⣿⣼⣿⣿⣧⣤⡸⢿⣿⡀⠂⠁⣸⣿⣿⣿⣿⣇⠄⠈⢀⣿⣿⠿ 
	 * ⣰⣿⣿⣿⣿⣿⣿⣿⣷⣤⣈⣙⠶⢾⠭⢉⣁⣴⢯⣭⣵⣶⠾⠓⢀⣴
	 * ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣉⣤⣴⣾⣿⣿⣦⣄⣤⣤⣄⠄⢿⣿
	 * ⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠈⢿
	 * ⣿⣿⣿⣿⣿⣿⡟⣰⣞⣛⡒⢒⠤⠦⢬⣉⣉⣉⣉⣉⣉⣉⡥⠴⠂⢸
	 * ⠻⣿⣿⣿⣿⣏⠻⢌⣉⣉⣩⣉⡛⣛⠒⠶⠶⠶⠶⠶⠶⠶⠶⠂⣸⣿
	 * ⣥⣈⠙⡻⠿⠿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⠿⠛⢉⣠⣶⣶⣿⣿
	 * ⣿⣿⣿⣶⣬⣅⣒⣒⡂⠈⠭⠭⠭⠭⠭⢉⣁⣄⡀⢾⣿⣿⣿⣿⣿⣿

*/

#import "NSArray+Swizzling.h"
#import "NSObject+Swizzling.h"

@implementation NSMutableArray (Swizzling)
+ (void)load{
    [objc_getClass("__NSArrayM") mt_exchangeInstanceMethod:@selector(addObject:) withMethod:@selector(my_addObject:)];
}
- (void)my_addObject:(id)anObject{
    if (anObject) {
        [self my_addObject:anObject];
    }else{
        NSString *tip = @"数组 nil crash";
        #ifdef DEBUG
            NSAssert(0, tip);
        #endif
        NSLog(tip);
    }
}

@end


@implementation NSArray (Swizzling)

+ (void)load{
    [objc_getClass("__NSArray0") mt_exchangeInstanceMethod:@selector(objectAtIndex:) withMethod:@selector(my_objectAtIndex_0:)];
    [objc_getClass("__NSSingleObjectArrayI") mt_exchangeInstanceMethod:@selector(objectAtIndex:) withMethod:@selector(my_objectAtIndex_1:)];
    [objc_getClass("__NSArrayI") mt_exchangeInstanceMethod:@selector(objectAtIndex:) withMethod:@selector(my_objectAtIndex_I:)];
    [objc_getClass("__NSArrayM") mt_exchangeInstanceMethod:@selector(objectAtIndex:) withMethod:@selector(my_objectAtIndex_M:)];
}

- (id)my_objectAtIndex_0:(NSUInteger)index{
    NSString *tip = @"空数组越界";
    #ifdef DEBUG
        NSAssert(0, tip);
    #endif
    NSLog(tip);
    return nil;
}
- (id)my_objectAtIndex_1:(NSUInteger)index{
    if (index > 0) {
        NSString *tip = @"数组越界";
        #ifdef DEBUG
            NSAssert(0, tip);
        #endif
        NSLog(tip);
    }

    return [self my_objectAtIndex_1:0];
}
- (id)my_objectAtIndex_I:(NSUInteger)index{
    if (index < self.count) {
        return [self my_objectAtIndex_I:index];
    }
    NSString *tip = @"数组越界";
    #ifdef DEBUG
        NSAssert(0, tip);
    #endif
    NSLog(tip);
    return self.firstObject;
}
- (id)my_objectAtIndex_M:(NSUInteger)index{
    if (index < self.count) {
        return [self my_objectAtIndex_M:index];
    }
    NSString *tip = @"数组越界";
    #ifdef DEBUG
        NSAssert(0, tip);
    #endif
    NSLog(tip);
    
    return self.firstObject;
}

@end
