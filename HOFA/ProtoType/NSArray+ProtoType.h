//
//  NSArray+ProtoType.h
//  Additions
//
//  Created by iOS on 2019/1/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef BOOL(^boolCondition)(id item);
typedef id _Nullable (^condition)(id item);
@interface NSArray (ProtoType)

/**
 *
 * @brief Returns the value of the first element in the provided array that satisfies the provided condition. If no values satisfy the condition, nil is returned.
 * @param condition The block which used to test the element.
 * @return The first element satisfied the condition.
 *
 */
- (id)find:(boolCondition)condition;

/**
 *
 * @brief Test whether at least one element in the array passes the test implemented by the provided condition. It returns true if, in the array, it finds an element for which the provided condition returns true; otherwise it returns false. It doesn't modify the array.
 * @param condition The block which used to test the element.
 * @return A Boolean value that specifies whether at least one element in the array passes the test.
 *
 */
- (BOOL)some:(boolCondition)condition;

/**
 *
 * @brief Test whether all elements in the array pass the test implemented by the provided condition. It returns a Boolean value.
 * @param condition The block which used to test the element.
 * @return A Boolean value that specifies whether all elements in the array passes the test.
 *
 */
- (BOOL)every:(boolCondition)condition;

/**
 *
 * @brief Create a new array with all elements that pass the test implemented by the provided condition.
 * @param condition The block which used to test the element.
 * @return The new array with all elements that pass the test.
 *
 */
- (id)filter:(boolCondition)condition;

/**
 *
 * @brief Create a new array populated with the results of calling a provided condition on every element in the calling array.
 * @param condition The block which used to test the element.
 * @return The new array populated with the results of calling a provided condition on every element in the calling array.
 *
 */
- (id)map:(condition)condition;

@end
NS_ASSUME_NONNULL_END
