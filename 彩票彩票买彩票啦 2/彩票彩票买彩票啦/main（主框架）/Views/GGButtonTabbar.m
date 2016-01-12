//
//  GGButtonTabbar.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/25.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGButtonTabbar.h"
#import "GGcancleLight.h"


@interface GGButtonTabbar ()

@property (nonatomic, weak)UIButton *selectedButton;

@end

@implementation GGButtonTabbar

// 实现一个添加底部bottom bar button的方法
- (void)addBottomBarButtonWithImage:(NSString *)normal selected:(NSString *)selected {
    // 1. 创建一个按钮
    GGcancleLight *button = [[GGcancleLight alloc] init];
    
    // 设置按钮的背景图片
    [button setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    
    // 为按钮指定一个单击事件
    [button addTarget:self action:@selector(didClickBottomBarButton:) forControlEvents:UIControlEventTouchDown];
    
    // 把按钮添加到底部的bottom bar view中(self)
    [self addSubview:button];
}

// 底部按钮的单击事件
- (void)didClickBottomBarButton:(UIButton *)sender {
    
    // 0. 点击某个按钮, 让当前被点击的按钮selected = YES
    self.selectedButton.selected = NO;
    sender.selected = YES;
    self.selectedButton = sender;
    
    
    
    
    // 1. 获取当前点击的按钮的索引
    int idx = (int)sender.tag;
    
    // 2. 根据当前点击的按钮的索引, 切换TabBar控制器中, 当前显示的子控制器
    if ([self.delegate respondsToSelector:@selector(bottomBarView:didClickBottomBarButtonWithIndex:)]) {
        [self.delegate bottomBarView:self didClickBottomBarButtonWithIndex:idx];
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat w = self.bounds.size.width / self.subviews.count;
    CGFloat h = self.bounds.size.height;
    CGFloat y = 0;
    for (int i = 0; i < self.subviews.count; i++) {
        CGFloat x = i  * w;
        UIButton *button = self.subviews[i];
        // 为每个按钮绑定一个tag
        button.tag = i;
        
        button.frame = CGRectMake(x, y, w, h);
        
        
        if (i == 0) {
            button.selected = YES;
            self.selectedButton = button;
        }
    }
}










@end
