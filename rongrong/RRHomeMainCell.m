//
//  RRHomeMainCell.m
//  rongrong
//
//  Created by guoyongfeng on 16/7/15.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import "RRHomeMainCell.h"
#import "RRRoundView.h"

@interface RRHomeMainCell ()

@property (weak, nonatomic) IBOutlet UILabel *showTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;
@property (weak, nonatomic) IBOutlet RRRoundView *roundView;

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyDesLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeDesLabel;

@property (weak, nonatomic) IBOutlet UILabel *rateLabel;
@property (weak, nonatomic) IBOutlet UILabel *rateDesLabel;

@property (nonatomic,strong)NSArray * moneyArray;
@property (nonatomic,strong)NSArray * timeArray;
@property (nonatomic,strong)NSArray * rateArray;
@property (nonatomic,strong)NSArray * doneArray;


@end

@implementation RRHomeMainCell

- (void)awakeFromNib {
}

- (void)setIsAble:(BOOL)isAble{
    _isAble = isAble;
    if (isAble) {
        self.showTitleLabel.textColor = [UIColor blackColor];
        self.moneyLabel.textColor = chengColor;
        self.timeLabel.textColor = lanColor;
        self.rateLabel.textColor = luColor;
        self.moneyDesLabel.textColor = huiColor;
        self.timeDesLabel.textColor = huiColor;
        self.rateDesLabel.textColor = huiColor;
    }else{
        self.showTitleLabel.textColor = qianhuiColor;
        self.moneyLabel.textColor = qianhuiColor;
        self.timeLabel.textColor = qianhuiColor;
        self.rateLabel.textColor = qianhuiColor;
        self.moneyDesLabel.textColor = qianhuiColor;
        self.timeDesLabel.textColor = qianhuiColor;
        self.rateDesLabel.textColor = qianhuiColor;
    }
}

-(void)updateInfoByIndexPath:(NSInteger)indexPath{
    if (self.isZhuanxiang) {
        self.showTitleLabel.text = @"新手专享";
        self.rightImage.image = [UIImage imageNamed:@"head_customized"];
    }else{
        self.rightImage.image = [UIImage imageNamed:@"getinto_icon"];
        switch (indexPath%3) {
            case 0:
                self.showTitleLabel.text = [NSString stringWithFormat:@"活期宝%ld-期数A",indexPath/3+1000];
                break;
            case 1:
                self.showTitleLabel.text = [NSString stringWithFormat:@"活期宝%ld-期数B",indexPath/3+1000];
                break;
            case 2:
                self.showTitleLabel.text = [NSString stringWithFormat:@"众善汇%ld-期数A",indexPath/3+1600];
                break;
            default:
                break;
        }
    }
    
    self.moneyLabel.text = self.moneyArray[arc4random()%6];
    self.timeLabel.text = self.timeArray[arc4random()%6];
    self.rateLabel.text = self.rateArray[arc4random()%6];
    if (!_isAble) {
        self.roundView.progress = 0;
        self.roundView.middleLabel.text = @"还款中";
        
    }else{
        self.roundView.progress = [self.doneArray[arc4random()%4] floatValue];
    }
    
}

-(NSArray *)moneyArray{
    return @[@"1000万",@"8000万",@"1500万",@"5000万",@"3000万",@"7000万"];
}

-(NSArray *)timeArray{
    return @[@"2个月",@"4个月",@"5个月",@"1个月",@"8个月",@"6个月"];
}

-(NSArray *)rateArray{
    return @[@"6.00%",@"8.00%",@"4.80%",@"5.20%",@"9.15%",@"4.25%"];
}

-(NSArray *)doneArray{
    return @[@"0.6",@"0.8",@"0.75",@"0.56"];
}


@end
