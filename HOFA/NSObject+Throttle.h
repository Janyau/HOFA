//
//  NSObject+Throttle.h
//  ArrayTool
//
//  Created by iOS on 2021/4/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^fnBlock)(void);
@interface NSObject (Throttle)
+ (fnBlock)debounceWithBlock:(fnBlock)fn waitTime:(NSTimeInterval)waitTime;
@end

NS_ASSUME_NONNULL_END
