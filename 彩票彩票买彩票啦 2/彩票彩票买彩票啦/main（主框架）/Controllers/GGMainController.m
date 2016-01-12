//
//  GGMainController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/25.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGMainController.h"
#import "GGButtonTabbar.h"

@interface GGMainController ()<GGButtonTabbarDelegate>


@end

@implementation GGMainController

-(void)bottomBarView:(GGButtonTabbar *)buttonTabbar didClickBottomBarButtonWithIndex:(int)index{
    
    self.selectedIndex = index;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //1、加载5个导航控制器
    [self loadSubController];

    // 2. 加载自定义底部TabBar
    GGButtonTabbar *bottomBar = [[GGButtonTabbar alloc] init];
    // 设置代理
    bottomBar.delegate = self;
    
    // 2.1 通过循环, 创建若干个底部的bottom bar button （根据当前tab bar controller中有几个子控制器, 那么就创建几个底部的按钮）
    for (int i = 0; i < self.viewControllers.count; i++) {
        // 拼接图片的名称
        NSString *normal = [NSString stringWithFormat:@"TabBar%d", (i + 1)];
        NSString *selected = [NSString stringWithFormat:@"TabBar%dSel", (i + 1)];
        // 调用bottom bar view内部的addXxxx方法来创建一个底部的按钮
        [bottomBar addBottomBarButtonWithImage:normal selected:selected];
    }
    
    bottomBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:bottomBar];
    
   
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
