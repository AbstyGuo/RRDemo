//
//  RRRoundView.m
//  rongrong
//
//  Created by guoyongfeng on 16/7/15.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import "RRRoundView.h"

@implementation RRRoundView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self installView];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self installView];
    }
    return self;
}

-(void)installView{
    self.middleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH(self), 20)];
    [self addSubview:self.middleLabel];
    CGPoint center = self.middleLabel.center;
    center.y = HEIGHT(self)/2;
    self.middleLabel.center = center;
    self.backgroundColor = [UIColor whiteColor];
    self.middleLabel.textAlignment = NSTextAlignmentCenter;
    self.middleLabel.font = [UIFont systemFontOfSize:15];
}

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    self.middleLabel.text = [NSString stringWithFormat:@"%ld%%",(NSInteger)((progress*100)+0.5)];
    if (_progress == 0) {
        self.middleLabel.textColor = qianhuiColor;
    }else{
        self.middleLabel.textColor = luColor;
    }
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    // Drawing code
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.width * 0.5);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:rect.size.width/2-3 startAngle:-M_PI_2 endAngle:M_PI_2 * 3 clockwise:YES];
    
    path.lineWidth = 6;
    [qianhuiColor set];
    path.lineCapStyle = kCGLineCapRound;
    
    [path stroke];
    if (_progress>0) {
        UIBezierPath *pathx = [UIBezierPath bezierPathWithArcCenter:center radius:rect.size.width/2-3 startAngle:-M_PI_2 endAngle: M_PI_2*3*_progress clockwise:YES];
        
        pathx.lineWidth = 6;
        [[UIColor redColor] set];
        pathx.lineCapStyle = kCGLineCapRound;
        
        [pathx stroke];
    }
    
}


@end
