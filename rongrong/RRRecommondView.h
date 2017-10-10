//
//  RRRecommondView.h
//  rongrong
//
//  Created by guoyongfeng on 16/7/15.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRRoundView.h"

@interface RRRecommondView : UIView

@property(nonatomic,weak) IBOutlet UILabel * titleLabel;

@property(nonatomic,weak) IBOutlet UILabel * rateLabel;

@property(nonatomic,weak) IBOutlet RRRoundView * roundView;


@end
