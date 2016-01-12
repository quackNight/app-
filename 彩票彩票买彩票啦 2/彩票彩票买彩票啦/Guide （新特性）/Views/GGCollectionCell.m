//
//  GGCollectionCell.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/29.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGCollectionCell.h"
#import "GGMainController.h"

@interface GGCollectionCell ()

@property (nonatomic ,strong)UIImageView *imageView;
@property (nonatomic ,strong)UIButton *button;

@end

@implementation GGCollectionCell

#pragma mark - 懒加载

-(UIImageView *)imageView{
    
    if (_imageView == nil) {
        
        _imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

-(UIButton *)button{
    
    if (_button == nil) {
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置button背景图片为“立即开始体验”
        [_button setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        [_button addTarget:self action:@selector(didButtonEnterApp) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:_button];
        
        
    }
    return _button;
}

-(void)setImage:(UIImage *)image{
    
    _image = image;
    self.imageView.image = image;
}

-(void)setCellCount:(int)count compareWithindex:(int)index{
    
//    index == count - 1?self.button.hidden = NO:YES;
    
    if (index == count -1) {
        
        self.button.hidden = NO;
    }else{
        
        self.button.hidden = YES;
    }
    
   
    
}
-(void)didButtonEnterApp{
    
    GGMainController *mainCtrl = [[GGMainController alloc]init];
    //让控制器变成跟控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = mainCtrl;
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    //背景图片占据整个屏幕
    self.imageView.frame = self.bounds;
    
    //设置button的frame
    CGFloat w = 161;
    CGFloat h = 40;
    CGFloat y = self.bounds.size.height * 0.9;
    CGFloat x = (self.bounds.size.width - w) * 0.5;
    
    self.button.frame = CGRectMake(x, y, w, h);
}


@end
