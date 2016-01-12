//
//  GGHallController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/25.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGHallController.h"

@interface GGHallController ()

@property (nonatomic, weak)UIView *cover;
@property (nonatomic, weak)UIImageView *pic;
@property (nonatomic, weak)UIButton *btn;

@end

@implementation GGHallController
- (IBAction)didClickGiftBtn:(id)sender {
    
    //创建半透明的背景
    UIView *cover =[[UIView alloc]initWithFrame:self.view.frame];
    cover.backgroundColor = [UIColor darkGrayColor];
    cover.alpha = 0.5;
    
    [self.tabBarController.view addSubview:cover];
    self.cover = cover;
    
    
    
    //创建一个图片
    UIImageView *pic = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"showActivity"]];
    pic.center = cover.center;
    pic.userInteractionEnabled = YES;
    
    [self.tabBarController.view addSubview:pic];
    self.pic = pic;
    
    
    
    //创建一个按钮
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    //添加关闭窗口的点击事件
    [btn addTarget:self action:@selector(didCancel) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat btnW = 20;
    CGFloat btnH = 20;
    CGFloat btnX = self.view.center.x + pic.bounds.size.width / 2 -btnW;
    CGFloat btnY = self.view.center.y - pic.bounds.size.height/ 2;
    btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    [self.tabBarController.view addSubview:btn];
    self.btn = btn;
    
}
//实现窗口的点击事件
-(void)didCancel{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.pic.alpha = 0;
        self.cover.alpha = 0;
    } completion:^(BOOL finished) {
        [self.pic removeFromSuperview];
        [self.cover removeFromSuperview];
        [self.btn removeFromSuperview];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
