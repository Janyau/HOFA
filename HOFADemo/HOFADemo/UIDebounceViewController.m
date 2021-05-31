//
//  UIDebounceViewController.m
//  HOFADemo
//
//  Created by iOS on 2021/5/18.
//

#import "UIDebounceViewController.h"
#import "GlobalMacro.h"
#import "UIView+Frame.h"
#import <hofa.h>

@interface UIDebounceViewController ()
@property(nonatomic, strong) UILabel *screenLabel;
@property(nonatomic, assign) NSInteger mode;
@property(nonatomic, copy) fnBlock increaseDebounce;
@end

@implementation UIDebounceViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createFireView];
}

- (void)createFireView {
    UIButton *fireBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [fireBtn setBackgroundImage:[UIImage imageNamed:@"circle_green"] forState:UIControlStateNormal];
    [fireBtn setBackgroundImage:[UIImage imageNamed:@"circle_gray"] forState:UIControlStateHighlighted];
    [fireBtn setTitle:@"+1" forState:UIControlStateNormal];
    fireBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    [fireBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fireBtn.layer.cornerRadius = fireBtn.width / 2.0;
    fireBtn.layer.masksToBounds = YES;
    fireBtn.centerX = UISCREEN_WIDTH / 2.0;
    fireBtn.centerY = UISCREEN_HEIGHT / 2.0;
    [fireBtn addTarget:self action:@selector(increase) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fireBtn];
    
    
    UILabel *screenLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
    screenLabel.bottom = fireBtn.top - 80;
    screenLabel.centerX = fireBtn.centerX;
    screenLabel.backgroundColor = [UIColor colorWithRed:11/255.0 green:178/255.0 blue:122/255.0 alpha:1.0];
    screenLabel.textColor = [UIColor whiteColor];
    screenLabel.font = [UIFont systemFontOfSize:30];
    screenLabel.textAlignment = NSTextAlignmentCenter;
    screenLabel.text = @"0";
    [self.view addSubview:screenLabel];
    self.screenLabel = screenLabel;
    
    
    UISegmentedControl *segCtrl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    segCtrl.top = fireBtn.bottom + 80;
    segCtrl.centerX = fireBtn.centerX;
    [segCtrl insertSegmentWithTitle:@"普通" atIndex:0 animated:NO];
    [segCtrl insertSegmentWithTitle:@"防抖" atIndex:1 animated:NO];
    segCtrl.selectedSegmentIndex = 0;
    [segCtrl addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segCtrl];
}

- (void)increase {
    if (self.mode == 0) {
        [self updateValue];
    } else if (self.mode == 1) {
        if (!_increaseDebounce) {
            __weak typeof(self) weakSelf = self;
            self.increaseDebounce = [NSObject debounceWithBlock:^{
                [weakSelf updateValue];
            } waitTime:1.0];
        }
        self.increaseDebounce();
        self.increaseDebounce();
    }
}

- (void)updateValue {
    NSInteger lastNum = _screenLabel.text.integerValue;
    self.screenLabel.text = [NSString stringWithFormat:@"%ld", lastNum + 1];
}

- (void)segmentChange:(UISegmentedControl *)sender {
    self.mode = sender.selectedSegmentIndex;
}

- (void)dealloc {
    NSLog(@"-----------dealloc-----------");
}
@end
