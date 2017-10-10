//
//  RRSegmentView.m
//  rongrong
//
//  Created by guoyongfeng on 16/7/14.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import "RRSegmentView.h"

@interface RRSegmentView ()

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) NSMutableArray *barriers;
//@property (nonatomic, strong) UIView *slider;
@property (nonatomic, strong) UIImageView *slider;
@property (nonatomic, strong) UIView *bottomBorder;

@end

@implementation RRSegmentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundColor = [UIColor whiteColor];
    self.showBarView = YES;
    
    self.titleColor = [UIColor whiteColor];
    
    self.sliderColor = [UIColor clearColor];
    self.fontSize = 14.0f;
    
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    
    [self performSelectorOnMainThread:@selector(setupWithTitles:) withObject:titles waitUntilDone:NO];
}

-(void)addTitlesByArray:(NSArray *)titles
{
    _titles = titles;
    [self setupWithTitles:titles];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:backgroundColor];
    
    for(UIButton *b in self.buttons) {
        b.backgroundColor = backgroundColor;
    }
}

- (void)setSliderColor:(UIColor *)sliderColor {
    _sliderColor = sliderColor;
    
    self.slider.backgroundColor = sliderColor;
}

- (void)setShowBarView:(BOOL)showBarView {
    _showBarView = showBarView;
    for(UIView *v in self.barriers) {
        v.hidden = _showBarView;
    }
}

- (void)setFontSize:(CGFloat)fontSize {
    _fontSize = fontSize;
    
    for(UIButton *button in self.buttons) {
        button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
}

-(void)setSelectedFontSize:(CGFloat)selectedFontSize{
    _selectedFontSize = selectedFontSize;
    
    UIButton *button = [self.buttons objectAtIndex:_selectedIndex];
    button.titleLabel.font = [UIFont systemFontOfSize:selectedFontSize];
}

- (void)setupWithTitles:(NSArray *)titles {
    // TO-DO
    // 应该先删除之前的subview
    for(UIView *v in self.subviews) {
        [v removeFromSuperview];
    }
    
    self.bottomBorder = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT(self)-1, WIDTH(self), 1)];
    self.bottomBorder.backgroundColor = NavigationBarColor;
    self.bottomBorder.hidden = !self.showBottomBorder;
    [self addSubview:self.bottomBorder];
    
    self.slider = [[UIImageView alloc] initWithFrame:CGRectMake(0, HEIGHT(self)-2, WIDTH(self)/titles.count, 2)];
    self.slider.backgroundColor = self.sliderColor;
    self.slider.image = self.sliderImage;
    [self addSubview:self.slider];
    
    self.buttons = [[NSMutableArray alloc] init];
    for(int i=0; i<titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*(WIDTH(self)/titles.count), 0, (WIDTH(self)/titles.count), HEIGHT(self)-7);
        CGPoint center = button.center;
        center.y = self.center.y;
        button.center = center;
        button.backgroundColor = self.backgroundColor;
        button.tag = i;
        
        NSString *title = [self.titles objectAtIndex:i];
        button.titleLabel.font = [UIFont systemFontOfSize:17.f];
        button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateDisabled];
        [button setTitleColor:RGBColor(240, 180, 180) forState:UIControlStateNormal];
        [button setTitleColor:self.titleColor forState:UIControlStateDisabled];
        [button addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.buttons addObject:button];
        
        // 初始化后默认选中第一个
        if(i == 0) {
            button.enabled = NO;
            self.selectedIndex = 0;
        }
    }
    
    if(self.showBarView) {
        NSMutableArray *barriers = [NSMutableArray array];
        for(int i=1; i<titles.count; i++) {
            UIView *barrierView = [[UIView alloc] initWithFrame:CGRectMake(i*(WIDTH(self)/titles.count), HEIGHT(self)/2*0.5, 1, HEIGHT(self)*(1-0.5))];
            barrierView.backgroundColor = UIColorFromRGB(0xdfdfdf);
            [barriers addObject:barrierView];
            [self addSubview:barrierView];
        }
        self.barriers = barriers;
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    if(selectedIndex < 0 || selectedIndex > (self.titles.count-1)) {
        return;
    }
    
    UIButton *button = [self.buttons objectAtIndex:selectedIndex];
    [self segmentClick:button];
}

- (void)setSliderWidth:(CGFloat)sliderWidth {
    // 确保处于0.0f和1.0f之间
    
    if(sliderWidth <= 0.0f) {
        _sliderWidth = 0.0f;
    }
    
    if(sliderWidth >= 1.0f) {
        _sliderWidth = 1.0f;
    }
    
    _sliderWidth = sliderWidth;
    
    [self performSelectorOnMainThread:@selector(setupSlider) withObject:nil waitUntilDone:NO];
}

- (void)setupSlider {
    CGPoint center = self.slider.center;
    CGRect frame = self.slider.frame;
    frame.size.width *= _sliderWidth;
    self.slider.frame = frame;
    self.slider.center = center;
}

- (void)segmentClick:(UIButton *)button {
    // 撤销之前的选中
    UIButton *pre = [self.buttons objectAtIndex:self.selectedIndex];
    pre.enabled = !pre.enabled;
    pre.titleLabel.font = [UIFont systemFontOfSize:self.fontSize];
    
    // 完成当前选中
    button.enabled = !button.enabled;
    _selectedIndex = button.tag;
    if (_selectedFontSize) {
        button.titleLabel.font = [UIFont systemFontOfSize:self.selectedFontSize];
    }
    
    // 滑动slider
    [UIView animateWithDuration:0.2 animations:^{
        CGPoint center = self.slider.center;
        center.x = button.center.x;
        self.slider.center = center;
    }];
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    if ([_delegate respondsToSelector:@selector(SegementViewClickAtIndex:)]) {
        [_delegate SegementViewClickAtIndex:_selectedIndex];
    }
}

- (void)setSliderOffsetFactor:(CGFloat)sliderOffsetFactor {
    _sliderOffsetFactor = sliderOffsetFactor;
    
    CGPoint center = self.slider.center;
    UIButton *selectedButton = [self.buttons objectAtIndex:self.selectedIndex];
    center.x = selectedButton.center.x + _sliderOffsetFactor*CGRectGetWidth(selectedButton.frame);
    self.slider.center = center;
}

- (void)setShowBottomBorder:(BOOL)showBottomBorder {
    _showBottomBorder = showBottomBorder;
    
    self.bottomBorder.hidden = !showBottomBorder;
}

- (void)configButtonTitle:(NSAttributedString *)title forState:(UIControlState)state atIndex:(NSInteger)index {
    UIButton *button = [self.buttons objectAtIndex:index];
    [button setAttributedTitle:title forState:state];
}



@end
