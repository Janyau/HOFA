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

/**
 *
 * @param fn The block which need to be excuted using debounce plan.
 * @param waitTime The cycle time.
 * @return The return block which can be invoked many times.
 *
 */
+ (fnBlock)debounceWithBlock:(fnBlock)fn waitTime:(NSTimeInterval)waitTime;

/**
 *
 * @param fn The block which need to be excuted using throttling plan.
 * @param isExecuteBeforeCycle If isExecuteBeforeCycle is true, the fn block will be excuted first before cycle time; Otherwise, the fn block will be excuted after the cycle time.
 * @param waitTime The cycle time.
 * @return The return block which can be invoked many times.
 *
 */
+ (fnBlock)throttleWithBlock:(fnBlock)fn executeBeforeCycle:(BOOL)isExecuteBeforeCycle waitTime:(NSTimeInterval)waitTime;

@end

NS_ASSUME_NONNULL_END
