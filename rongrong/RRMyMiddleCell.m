//
//  RRMyMiddleCell.m
//  rongrong
//
//  Created by guoyongfeng on 16/7/15.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import "RRMyMiddleCell.h"

@interface RRMyMiddleCell ()

@property (weak, nonatomic) IBOutlet UILabel *canUseLabel;

@property (weak, nonatomic) IBOutlet UILabel *winLabel;

@property (weak, nonatomic) IBOutlet UILabel *alreadyLabel;


@end

@implementation RRMyMiddleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateInfo{
    self.canUseLabel.text = @"50,000";
    self.winLabel.text = @"110,000";
    self.alreadyLabel.text = @"108,000";
}

@end
