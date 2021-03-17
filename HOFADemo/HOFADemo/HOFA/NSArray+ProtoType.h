//
//  NSArray+ProtoType.h
//  Additions
//
//  Created by iOS on 2019/1/23.
//

#import <Foundation/Foundation.h>
#import "NSArray+Check.h"
#import "NSMutableArray+Check.h"

NS_ASSUME_NONNULL_BEGIN
typedef BOOL(^boolCondition)(id item);
typedef id _Nullable (^condition)(id item);
@interface NSArray (ProtoType)
- (id)find:(boolCondition)condition;
- (BOOL)some:(boolCondition)condition;
- (BOOL)every:(boolCondition)condition;

- (id)filter:(boolCondition)condition;
- (id)map:(condition)condition;
@end
NS_ASSUME_NONNULL_END
