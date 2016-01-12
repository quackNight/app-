//
//  GGAboutController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/26.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGAboutController.h"
#import "GGAboutHeadView.h"

@interface GGAboutController ()

@end

@implementation GGAboutController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GGAboutHeadView *headView = [GGAboutHeadView settingHeadView];
    
    self.tableView.tableHeaderView = headView;
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
