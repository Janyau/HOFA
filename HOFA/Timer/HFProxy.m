//
//  HFProxy.m
//  HOFADemo
//
//  Created by iOS on 2020/6/18.
//

#import "HFProxy.h"

@implementation HFProxy
+ (instancetype)proxyWithTarget:(id)target {
    HFProxy *proxy = [HFProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
