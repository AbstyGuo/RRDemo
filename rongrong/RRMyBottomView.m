//
//  RRMyBottomView.m
//  rongrong
//
//  Created by guoyongfeng on 16/7/15.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import "RRMyBottomView.h"
#import "RRButton.h"

@implementation RRMyBottomView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self installView];
    }
    return self;
}

-(void)installView{
    NSArray * titleArray = @[@"我要充值",@"我要提现",@"我的推广",@"资金明细",@"我的投资",@"我的借款"];
    NSArray * imageArray = @[@"wycz",@"wytx",@"wdtg",@"zjmx",@"wdtz",@"wdjd"];
    
    CGFloat x = 20;
    CGFloat y = 10;
    CGFloat width = (MainScreenWidth - 40-45)/3;
    CGFloat height = width + 30;
    
    for (int i = 0; i < titleArray.count; i++) {
        RRButton * btn = [[RRButton alloc]initWithFrame:CGRectMake(x+i%3*width, y+i/3*height, width, height)];
        btn.tag = 500+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.topImageView.image = [UIImage imageNamed:imageArray[i]];
        btn.bottomLabel.text = titleArray[i];
        [self addSubview:btn];
    }
}

- (void)btnClick:(UIButton *)button{
    if (self.ClickIndex) {
        self.ClickIndex(button.tag - 500);
    }
}

@end
