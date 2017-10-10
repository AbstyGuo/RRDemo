//
//  RRRootViewController.h
//  rongrong
//
//  Created by guoyongfeng on 16/7/14.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RRHomeViewController.h"
#import "RRTendsViewController.h"

@interface RRRootViewController : UIViewController

@property (nonatomic, strong) RRHomeViewController * homeVC;
@property (nonatomic, strong) RRTendsViewController * TendsVC;

@end
