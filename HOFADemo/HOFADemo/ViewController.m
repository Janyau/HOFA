//
//  ViewController.m
//  HOFADemo
//
//  Created by iOS on 2021/3/16.
//

#import "ViewController.h"
#import <hofa.h>
#import "UIDebounceViewController.h"
#import "GlobalMacro.h"
#import "UIView+Frame.h"
#import "HFTimer.h"

@interface ViewController ()
@property(nonatomic, strong) NSString *taskID;
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
    
    
    fnBlock debounce = [NSObject debounceWithBlock:^{
        NSLog(@"----------debounce-----------");
    } waitTime:3.0];
    debounce();
    debounce();
    debounce();
    
    [self createUIView];
}

- (void)createUIView {
    UIButton *fireBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [fireBtn setBackgroundImage:[UIImage imageNamed:@"circle_green"] forState:UIControlStateNormal];
    [fireBtn setBackgroundImage:[UIImage imageNamed:@"circle_gray"] forState:UIControlStateHighlighted];
    [fireBtn setTitle:@"Next" forState:UIControlStateNormal];
    fireBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    [fireBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fireBtn.layer.cornerRadius = 40;
    fireBtn.layer.masksToBounds = YES;
    fireBtn.centerX = UISCREEN_WIDTH / 2.0;
    fireBtn.centerY = UISCREEN_HEIGHT / 2.0;
    [fireBtn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fireBtn];
}

- (void)next {
    UIDebounceViewController *vc = [[UIDebounceViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)executeTimerEvent {
    // execute with block
    __weak typeof(self) weakself = self;
    self.taskID = [HFTimer executeTask:^{
        [weakself test];
    } start:2.0 interval:1.0 repeat:NO asyn:NO];

    // execute with target
    self.taskID = [HFTimer executeSelector:@selector(test) withObject:self start:2.0 interval:1.0 repeat:YES asyn:NO];
}

- (void)test {
    NSLog(@"%s",__func__);
}


- (void)dealloc {
    [HFTimer cancelTaskWithID:self.taskID];
    NSLog(@"%s",__func__);
}

@end
