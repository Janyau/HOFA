//
//  HFTimer.m
//  GCD-timer
//
//  Created by JanYau on 17/06/2020.
//  Copyright © 2020 JanYau. All rights reserved.
//

#import "HFTimer.h"
#import "HFProxy.h"

static NSMutableDictionary *timers_;
static dispatch_semaphore_t semaphore_;
static BOOL asyn_;

@implementation HFTimer
+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timers_ = [NSMutableDictionary dictionary];
        semaphore_ = dispatch_semaphore_create(1);
    });
}

+ (NSString *)executeTask:(void (^)(void))task start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeat:(BOOL)repeat asyn:(BOOL)asyn {
    if (!task || start < 0 || (repeat && interval <= 0)) return nil;
    asyn_ = asyn;
    
    dispatch_queue_t queue = asyn ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0);
    
    asyn && dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    NSString *taskID = [NSString stringWithFormat:@"_task_%lu", (unsigned long)timers_.count];
    timers_[taskID] = timer;
    asyn && dispatch_semaphore_signal(semaphore_);
    
    dispatch_source_set_event_handler(timer, ^{
        task();
        if (!repeat) {
            [self cancelTaskWithID:taskID];
        }
    });
    dispatch_resume(timer);
    

    return taskID;
}

+ (NSString *)executeSelector:(SEL)selector withObject:(id)target start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeat:(BOOL)repeat asyn:(BOOL)asyn {
    HFProxy *proxy = [HFProxy proxyWithTarget:target];
    return [self executeTask:^{
        if (proxy && [proxy respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [proxy performSelector:selector];
#pragma clang diagnostic pop
        }
    } start:start interval:interval repeat:repeat asyn:asyn];
}

+ (void)cancelTaskWithID:(NSString *)taskID {
    if (!taskID) return;
    
    asyn_ && dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    dispatch_source_t timer = timers_[taskID];
    if (timer) {
        dispatch_source_cancel(timer);
        [timers_ removeObjectForKey:taskID];
    }
    asyn_ && dispatch_semaphore_signal(semaphore_);
}

@end
