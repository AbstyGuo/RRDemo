//
//  RRButton.m
//  rongrong
//
//  Created by guoyongfeng on 16/7/15.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import "RRButton.h"

@implementation RRButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self installViewWithFrame:frame];
    }
    return self;
}

-(void)installViewWithFrame:(CGRect)frame{
    _topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, frame.size.width-20, frame.size.width-20)];
    [self addSubview:_topImageView];
    
    _bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, frame.size.height-40, frame.size.width - 20, 20)];
    _bottomLabel.textAlignment = NSTextAlignmentCenter;
    _bottomLabel.font = [UIFont systemFontOfSize:14];
    _bottomLabel.textColor = huiColor;
    [self addSubview:_bottomLabel];
}


@end
