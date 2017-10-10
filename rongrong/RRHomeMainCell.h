//
//  RRHomeMainCell.h
//  rongrong
//
//  Created by guoyongfeng on 16/7/15.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RRHomeMainCell : UITableViewCell

@property(nonatomic,assign) BOOL isZhuanxiang;
@property(nonatomic,assign) BOOL isAble;

-(void)updateInfoByIndexPath:(NSInteger)indexPath;

@end
