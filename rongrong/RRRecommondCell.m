//
//  RRRecommondCell.m
//  rongrong
//
//  Created by guoyongfeng on 16/7/15.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import "RRRecommondCell.h"
#import "RRRecommondView.h"

@interface RRRecommondCell ()

@property (weak, nonatomic) IBOutlet RRRecommondView *leftView;

@property (weak, nonatomic) IBOutlet RRRecommondView *rightView;

@end

@implementation RRRecommondCell

-(void)updateInfo{
    self.leftView.roundView.progress = 0.6;
    self.rightView.roundView.progress = 0.9;
    
    self.leftView.rateLabel.text = @"10.00%";
    self.rightView.rateLabel.text = @"12.00%";
}

@end
