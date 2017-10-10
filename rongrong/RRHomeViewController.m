//
//  RRHomeViewController.m
//  rongrong
//
//  Created by guoyongfeng on 16/7/14.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import "RRHomeViewController.h"
#import "SDCycleScrollView.h"
#import "RRHomeMainCell.h"
#import "RRRecommondCell.h"

@interface RRHomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.tableView.backgroundColor = MainBgColor;
    self.tableView.tableFooterView = [UIView new];
    
    //设置轮播图片信息和属性
    [self setcycleScrollViewInfo];
}

-(void)setcycleScrollViewInfo{
    
    NSArray * array = @[@"1.jpeg",@"2.jpg",@"3.jpg"];
    NSMutableArray * imageArray = [[NSMutableArray alloc]init];
    for (NSString * imageName in array) {
        UIImage * image = [UIImage imageNamed:imageName];
        [imageArray addObject:image];
    }

    self.cycleScrollView.localizationImageNamesGroup = imageArray;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        RRHomeMainCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID1" forIndexPath:indexPath];
        cell.isZhuanxiang = YES;
        cell.isAble = YES;
        [cell updateInfoByIndexPath:indexPath.row];
        return cell;
    }else if(indexPath.row == 1){
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID2" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 2){
        RRRecommondCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID3" forIndexPath:indexPath];
        [cell updateInfo];
        return cell;
    }else{
        
        RRHomeMainCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID1" forIndexPath:indexPath];
        cell.isZhuanxiang = NO;
        if (indexPath.row < 8) {
            cell.isAble = YES;
        }else{
            cell.isAble = NO;
        }
        [cell updateInfoByIndexPath:indexPath.row];
        return cell;

    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        return 25.f;
    }else if (indexPath.row == 2){
        return 240.f;
    }
    return 140.f;
}

@end
