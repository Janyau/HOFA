//
//  NSArray+Check.m
//  list
//
//  Created by iOS on 2018/8/16.
//  Copyright © 2018 iOS. All rights reserved.
//

#import "NSArray+Check.h"

@implementation NSArray (Check)
- (id)check_objectAtIndex:(NSUInteger)index {
    if (index < [self count]) {
        return [self objectAtIndex:index];
    }
    return nil;
}

@end
