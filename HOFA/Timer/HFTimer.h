//
//  HFTimer.h
//  GCD-timer
//
//  Created by JanYau on 17/06/2020.
//  Copyright © 2020 JanYau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFTimer : NSObject

/**
 *
 * @brief A GCD Timer, more precise.
 * @param task The block which need to be excuted.
 * @param start The start time of the timer.
 * @param interval The second interval for the timer.
 * @param repeat A Boolean value that specifies whether the task should be excuted repeatedly.
 * @param asyn A Boolean value that specifies whether the task should be excuted asynchronously.
 * @return The ID used to cancel the task.
 *
 */
+ (NSString *)executeTask:(void(^)(void))task
                    start:(NSTimeInterval)start
                 interval:(NSTimeInterval)interval
                   repeat:(BOOL)repeat
                     asyn:(BOOL)asyn;

/**
 *
 * @brief A GCD Timer, more precise.
 * @param selector The message to send to target.
 * @param target The object to which to send the message specified by aSelector.
 * @param start The start time of the timer.
 * @param interval The second interval for the timer.
 * @param repeat A Boolean value that specifies whether the task should be excuted repeatedly.
 * @param asyn A Boolean value that specifies whether the task should be excuted asynchronously.
 * @return The ID used to cancel the task
 *
 */
+ (NSString *)executeSelector:(SEL)selector
                   withObject:(id)target
                        start:(NSTimeInterval)start
                     interval:(NSTimeInterval)interval
                       repeat:(BOOL)repeat
                         asyn:(BOOL)asyn;

+ (void)cancelTaskWithID:(NSString *)taskID;
@end
