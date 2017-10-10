//
//  RRSegmentView.h
//  rongrong
//
//  Created by guoyongfeng on 16/7/14.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RRSegmentViewDelegate <NSObject>

-(void)SegementViewClickAtIndex:(NSInteger)index;

@end

/**
 *  自定义分段选择器,下方有一个滑动指示的slider,类似于Android
 */

@interface RRSegmentView : UIControl

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, assign) NSInteger selectedIndex;

// 0.0 - 1.0 之间
@property (nonatomic, assign) CGFloat sliderWidth;
@property (nonatomic, strong) UIColor *sliderColor;
@property (nonatomic, strong) UIImage *sliderImage;
@property (nonatomic, assign) CGFloat fontSize;  //不设置默认为15;
@property (nonatomic, assign) CGFloat selectedFontSize; //不设置默认为fontSize

// animation
@property (nonatomic, assign) CGFloat sliderOffsetFactor;

// 是否显示分割线
@property (nonatomic, assign) BOOL showBarView;

// 是否显示底部border
@property (nonatomic, assign) BOOL showBottomBorder;

@property (nonatomic,weak) id<RRSegmentViewDelegate> delegate;

- (void)configButtonTitle:(NSAttributedString *)title forState:(UIControlState)state atIndex:(NSInteger)index;


@end
