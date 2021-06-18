//
//  HFProxy.h
//  HOFADemo
//
//  Created by iOS on 2020/6/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HFProxy : NSProxy
@property(nonatomic, weak) id target;
+ (instancetype)proxyWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
