//
//  GGMainController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/25.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGMainController.h"
#import "GGButtonTabbar.h"

@interface GGMainController ()
@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic ,strong) UIButton *selBtn;

@property(nonatomic, assign) int index;

@end

@implementation GGMainController

-(NSMutableArray *)btns{
    
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //加载5个导航控制器
    [self loadSubController];

//     [self.tabBar removeFromSuperview];
    
    
    for (int i = 0; i < self.viewControllers.count; i ++) {
        
        self.index = i;
        //设置tabbar的图片
        NSString *normalName = [NSString stringWithFormat:@"TabBar%d",i+ 1];
        NSString *selName = [NSString stringWithFormat:@"TabBar%dSel",i+ 1];
        //设置不同状态下的图片
        UIButton *btn =  [GGButtonTabbar buttonSetTarBarButtonNormalImage:normalName withSelectImage:selName];
    //标记
            btn.tag = i;
        
            [btn addTarget:self action:@selector(didChangeState:) forControlEvents:UIControlEventTouchUpInside];

        
        CGFloat btnW = self.view.frame.size.width / self.viewControllers.count;
        CGFloat btnH = 49;
        CGFloat btnX = btnW * i;
        CGFloat btnY = self.view.frame.size.height - btnH;
        btn.frame =CGRectMake(btnX, btnY, btnW, btnH);
        
        //默认第一个图标亮
        if (i == 0) {
            btn.selected = YES;
            self.selBtn = btn;
        }
    
        [self.btns addObject:btn];
        
        [self.view addSubview:btn];

    }
    
   
}


//加载tabbar
-(void)loadSubController{
    
    UINavigationController *navHall =  [self setNav:@"GGHall"];
    UINavigationController *navArena = [self setNav:@"GGArena"];
    UINavigationController *navDiscovery = [self setNav:@"GGDiscovery"];
    UINavigationController *navHistory = [self setNav:@"GGHistory"];
    UINavigationController *navMyLottery = [self setNav:@"GGMyLottery"];
    
    self.viewControllers = @[navHall, navArena, navDiscovery, navHistory, navMyLottery];
    
}
//载入storyBoard
-(UINavigationController *)setNav:(NSString *)storyName{
    
    UIStoryboard *story1 = [UIStoryboard storyboardWithName:storyName bundle:nil];
    return [story1 instantiateInitialViewController];
    
}

//点击按钮，让按钮亮起来
-(void)didChangeState:(UIButton *)sender{
    
    //关闭上一次点击的控制器
    self.selBtn.selected = NO;
    if (self.selBtn.tag != 0 ) {
        
        //        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    
    //判断两次点击按钮不同时触发
    if (self.selBtn.tag != sender.tag) {
        self.selBtn = sender;
        sender.selected = YES;
        //打开这次点击的控制器
        //        [self presentViewController:self.viewControllers[sender.tag] animated:YES completion:nil];
        
    }
    
    self.selectedIndex = self.selBtn.tag;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
