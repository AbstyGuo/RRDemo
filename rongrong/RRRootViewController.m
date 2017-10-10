//
//  RRRootViewController.m
//  rongrong
//
//  Created by guoyongfeng on 16/7/14.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import "RRRootViewController.h"
#import "RRSegmentView.h"
#import "AppDelegate.h"

@interface RRRootViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (nonatomic, strong) RRSegmentView *segmentView;

@end

@implementation RRRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.segmentView = ({
        RRSegmentView *segment = [[RRSegmentView alloc] initWithFrame:CGRectMake(0, 0, 120, CGRectGetHeight(self.navigationController.navigationBar.frame)+1)];
        segment.backgroundColor = [UIColor clearColor];
        segment.fontSize = 20.0f;
        segment.sliderColor = [UIColor whiteColor];
        segment.selectedFontSize = 22;
        segment.showBottomBorder = YES;
        segment.showBarView = NO;
        segment.titles = @[@"首页", @"动态"];
        segment.sliderWidth = 0.7;
        [segment addTarget:self action:@selector(segmentViewClick:) forControlEvents:UIControlEventValueChanged];
        self.navigationItem.titleView = segment;
        segment;
    });

    self.navigationItem.leftBarButtonItem = ({
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [btn setImage:[[UIImage imageNamed:@"消息"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:btn];
        item;
    });
    
    self.navigationItem.rightBarButtonItem = ({
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [btn setImage:[[UIImage imageNamed:@"head_info"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];

        [btn addTarget:self action:@selector(showMyView:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:btn];
        item;
    });

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.mainScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.mainScrollView.frame)*2, MainScreenHeight-64);
    self.mainScrollView.contentOffset = CGPointMake(CGRectGetWidth(self.mainScrollView.frame) * self.segmentView.selectedIndex, 0);
    self.homeVC.hidesBottomBarWhenPushed = YES;
    self.TendsVC.hidesBottomBarWhenPushed = YES;

}


- (void)segmentViewClick:(RRSegmentView *)segmentView {
    [self.mainScrollView setContentOffset:CGPointMake(segmentView.selectedIndex*CGRectGetWidth(self.mainScrollView.frame), 0) animated:YES];
}

-(RRHomeViewController *)homeVC{
    if(!_homeVC) {
        RRHomeViewController *hvc = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"RRHomeViewController"];
        [self addChildViewController:hvc];
        
        hvc.view.frame = CGRectMake(0, 0, WIDTH(self.mainScrollView), HEIGHT(self.mainScrollView));
        [self.mainScrollView addSubview:hvc.view];
        [hvc didMoveToParentViewController:self];
        
        _homeVC = hvc;
    }
    
    return _homeVC;
}

- (RRTendsViewController *)TendsVC {
    if(!_TendsVC) {
        RRTendsViewController *tvc = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"RRTendsViewController"];
        [self addChildViewController:tvc];
        tvc.view.frame = CGRectMake(MainScreenWidth, 0, CGRectGetWidth(self.mainScrollView.frame), CGRectGetHeight(self.mainScrollView.frame));
        [self.mainScrollView addSubview:tvc.view];
        [tvc didMoveToParentViewController:self];
        _TendsVC = tvc;
    }
    return _TendsVC;
}


-(void)showMyView:(UIButton *)btn{
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;

    [delegate.DDController showRightViewController:YES];
}

@end
