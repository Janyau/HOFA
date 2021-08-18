//
//  NSObject+Throttle.m
//  ArrayTool
//
//  Created by iOS on 2021/4/1.
//

#import "NSObject+Throttle.h"

@implementation NSObject (Throttle)
+ (fnBlock)debounceWithBlock:(fnBlock)fn waitTime:(NSTimeInterval)waitTime {
    __block BOOL haveTimer = NO;
    fnBlock returnFn = ^{
        if (haveTimer) {
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(performFn:) object:fn];
            haveTimer = NO;
        }
        [self performSelector:@selector(performFn:) withObject:fn afterDelay:waitTime];
        haveTimer = YES;
    };
    return returnFn;
}

+ (fnBlock)throttleWithBlock:(fnBlock)fn executeBeforeCycle:(BOOL)isExecuteBeforeCycle waitTime:(NSTimeInterval)waitTime {
    __block NSTimeInterval prevTime = 0;
    if (!isExecuteBeforeCycle) {
        prevTime = [[NSDate date] timeIntervalSince1970];
    }
    fnBlock returnFn = ^{
        NSTimeInterval nowTime = [[NSDate date] timeIntervalSince1970];
        if (nowTime - prevTime > waitTime) {
            [self performSelector:@selector(performFn:) withObject:fn];
            prevTime = nowTime;
        }
    };
    return returnFn;
}

+ (void)performFn:(fnBlock)fn {
    fn();
}

@end
