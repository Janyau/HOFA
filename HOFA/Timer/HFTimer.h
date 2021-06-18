//
//  HFTimer.h
//  GCD-timer
//
//  Created by JanYau on 17/06/2020.
//  Copyright © 2020 JanYau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFTimer : NSObject
+ (NSString *)executeTask:(void(^)(void))task
                    start:(NSTimeInterval)start
                 interval:(NSTimeInterval)interval
                   repeat:(BOOL)repeat
                     asyn:(BOOL)asyn;

+ (NSString *)executeSelector:(SEL)selector
                   withObject:(id)target
                        start:(NSTimeInterval)start
                     interval:(NSTimeInterval)interval
                       repeat:(BOOL)repeat
                         asyn:(BOOL)asyn;

+ (void)cancelTaskWithID:(NSString *)taskID;
@end
