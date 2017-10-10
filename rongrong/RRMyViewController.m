//
//  RRMyViewController.m
//  rongrong
//
//  Created by guoyongfeng on 16/7/14.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import "RRMyViewController.h"
#import "RRMyInfoView.h"
#import "RRMyBottomView.h"
#import "RRMyMiddleCell.h"

@interface RRMyViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet RRMyInfoView *myInfoView;

@end

@implementation RRMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RRMyBottomView * bottom = [[RRMyBottomView alloc]initWithFrame: CGRectMake(0, 0, MainScreenWidth, ((MainScreenWidth - 40-45)/3+30)*2+20)];
    bottom.ClickIndex = ^(NSInteger index){
        DLog(@"点击了%ld个按钮",index);
    };
    self.tableView.tableFooterView = bottom;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RRMyMiddleCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Middle" forIndexPath:indexPath];
    [cell updateInfo];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

@end
