//
//  NSArray+ProtoType.m
//  Additions
//
//  Created by iOS on 2019/1/23.
//

#import "NSArray+ProtoType.h"

@implementation NSArray (ProtoType)
- (id)find:(boolCondition)condition {
    if (self && [self isKindOfClass:[NSArray class]]) {
        NSArray *list = self;
        if (!condition) {
            return nil;
        }
        for (id item in list) {
            if (condition(item)) {
                return item;
            }
        }
        return nil;
    }
    return nil;
}

- (BOOL)some:(boolCondition)condition {
    if (self && [self isKindOfClass:[NSArray class]]) {
        NSArray *list = self;
        if (!condition) {
            return NO;
        }
        for (id item in list) {
            if (condition(item)) {
                return YES;
            }
        }
        return NO;
    }
    return NO;
}

- (BOOL)every:(boolCondition)condition {
    if (self && [self isKindOfClass:[NSArray class]]) {
        NSArray *list = self;
        if (!condition) {
            return NO;
        }
        for (id item in list) {
            if (!condition(item)) {
                return NO;
            }
        }
        return YES;
    }
    return NO;
}

- (id)filter:(boolCondition)condition {
    if (self && [self isKindOfClass:[NSArray class]]) {
        NSArray *list = self;
        if (!condition) {
            return nil;
        }
        NSMutableArray *newList = [NSMutableArray array];
        for (id item in list) {
            if (item && condition(item)) {
                [newList addObject:item];
            }
        }
        return newList.count == 0 ? nil : newList;
    }
    return nil;
}

- (id)map:(condition)condition {
    if (self && [self isKindOfClass:[NSArray class]]) {
        NSArray *list = self;
        if (!condition) {
            return nil;
        }
        NSMutableArray *newList = [NSMutableArray array];
        for (id item in list) {
            id newItem = condition(item);
            if (newItem) {
                [newList addObject:newItem];
            }
        }
        return newList.count == 0 ? nil : newList;
    }
    return nil;
}
@end
