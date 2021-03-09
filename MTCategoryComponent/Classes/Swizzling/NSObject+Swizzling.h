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

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzling)
+ (BOOL)mt_exchangeInstanceMethod:(SEL)sel1 withMethod:(SEL)sel2;
@end

NS_ASSUME_NONNULL_END
