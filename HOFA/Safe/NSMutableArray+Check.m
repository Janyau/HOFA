//
//  NSMutableArray+Check.m
//  list
//
//  Created by iOS on 2018/8/16.
//  Copyright © 2018 iOS. All rights reserved.
//

#import "NSMutableArray+Check.h"

@implementation NSMutableArray (Check)
- (id)check_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (void)check_addObject:(id)anObject {
    if (anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO) {
        [self addObject:anObject];
    }
}

- (void)check_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (index <= self.count && anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO) {
        [self insertObject:anObject atIndex:index];
    }
}

- (void)check_removeObjectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }
}

- (void)check_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (index < self.count && anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}

@end
