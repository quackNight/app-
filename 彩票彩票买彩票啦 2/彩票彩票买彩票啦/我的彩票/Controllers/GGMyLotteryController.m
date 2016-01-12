//
//  GGMyLotteryController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/26.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGMyLotteryController.h"
#import "GGMianSettingController.h"
#import "GGNormalQuestionController.h"


@interface GGMyLotteryController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;


@end

@implementation GGMyLotteryController
- (IBAction)didClickItem:(UIButton *)sender {
    
    GGMianSettingController *mainSettingVc = [[GGMianSettingController alloc]init];
    
    mainSettingVc.navigationItem.title = @"设置";
    
    mainSettingVc.plist = @"HMSettingsIndex.plist";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(didClickNormalQuestion)];
    
    mainSettingVc.navigationItem.rightBarButtonItem = item;
    
    [self.navigationController pushViewController:mainSettingVc animated:YES];
    
}
-(void)didClickNormalQuestion{
    
    GGNormalQuestionController *normalVc = [[GGNormalQuestionController alloc]init];
    
    normalVc.navigationItem.title = @"常见问题";
    [self.navigationController pushViewController:normalVc animated:YES];
    
    
}


- (void)viewDidLoad {

    [super viewDidLoad];
    
    
    
    //设置登录的背景图片
    
    UIImage *normal = [UIImage imageNamed:@"RedButton"];
    UIImage *light = [UIImage imageNamed:@"RedButtonPressed"];
    
    normal =[normal stretchableImageWithLeftCapWidth:normal.size.width * 0.5 topCapHeight:light.size.height * 0.5];
    light = [light stretchableImageWithLeftCapWidth:light.size.width * 0.5 topCapHeight:light.size.height * 0.5];
    
    [self.loginButton setBackgroundImage:normal forState:UIControlStateNormal];
    [self.loginButton setBackgroundImage:light forState:UIControlStateHighlighted];

    
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
