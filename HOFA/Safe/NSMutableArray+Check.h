//
//  NSMutableArray+Check.h
//  list
//
//  Created by iOS on 2018/8/16.
//  Copyright © 2018 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Check)
- (id)check_objectAtIndex:(NSUInteger)index;
- (void)check_addObject:(id)anObject;
- (void)check_insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)check_removeObjectAtIndex:(NSUInteger)index;
- (void)check_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
@end
