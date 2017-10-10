//
//  RRTool.h
//  rongrong
//
//  Created by guoyongfeng on 16/7/14.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RRTool : NSObject

/**
 *  根据制定颜色和大小生成UIImage对象
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return UIImage
 */

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


@end
