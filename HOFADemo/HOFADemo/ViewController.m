//
//  ViewController.m
//  HOFADemo
//
//  Created by iOS on 2021/3/16.
//

#import "ViewController.h"
#import "HOFA/hofa.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // NSArray
    NSArray *list = @[@"1", @"2", @"3", @"4", @"5"];
    NSString *item = [list check_objectAtIndex:10];
    NSLog(@"-->%@", item);
    
    
    // NSMutableArray
    NSMutableArray *mList = [NSMutableArray arrayWithObject:list];
    [mList check_objectAtIndex:10];
    [mList check_addObject:@"10"];
    [mList check_insertObject:@"item" atIndex:10];
    [mList check_replaceObjectAtIndex:10 withObject:@"item"];
    [mList check_removeObjectAtIndex:10];
    
    
    // Higher order function
    NSString *findItem = [list find:^BOOL(NSString * _Nonnull item) {
        return [item isEqualToString:@"3"];
    }];
    NSLog(@"findItem-->%@", findItem);
    
    
    BOOL isVerifySome = [list some:^BOOL(NSString * _Nonnull item) {
        return item.integerValue > 3;
    }];
    NSLog(@"isVerifySome-->%d", isVerifySome);
    
    
    BOOL isVerifyEvery = [list every:^BOOL(NSString * _Nonnull item) {
        return item.integerValue > 3;
    }];
    NSLog(@"isVerifyEvery-->%d", isVerifyEvery);
    
    
    NSArray *filterList = [list filter:^BOOL(NSString * _Nonnull item) {
        return item.integerValue > 3;
    }];
    NSLog(@"filterList-->%@", filterList);
    
    
    NSArray *mapList = [list map:^id(NSString * _Nonnull item) {
        NSNumber *obj = [NSNumber numberWithInteger:item.integerValue];
        return obj;
    }];
    NSLog(@"mapList-->%@", mapList);
}


@end
