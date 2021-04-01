//
//  NSObject+Throttle.m
//  ArrayTool
//
//  Created by iOS on 2021/4/1.
//

#import "NSObject+Throttle.h"

@implementation NSObject (Throttle)
+ (fnBlock)debounceWithBlock:(fnBlock)fn waitTime:(NSTimeInterval)waitTime {
    __block NSInteger haveTimer = NO;
    fnBlock returnFn = ^{
        if (haveTimer) {
            [NSObject cancelPreviousPerformRequestsWithTarget:self];
            haveTimer = NO;
        }
        [self performSelector:@selector(performFn:) withObject:fn afterDelay:waitTime];
        haveTimer = YES;
    };
    return returnFn;
}

+ (void)performFn:(fnBlock)fn {
    fn();
}
@end
