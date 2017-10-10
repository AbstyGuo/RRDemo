//
//  RRMyBottomView.h
//  rongrong
//
//  Created by guoyongfeng on 16/7/15.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RRMyBottomView : UIView

@property(nonatomic,copy) void (^ClickIndex)(NSInteger index);

@end
