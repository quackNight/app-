//
//  GGLuckyChooseController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/25.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGLuckyChooseController.h"

@interface GGLuckyChooseController ()
@property (weak, nonatomic) IBOutlet UIImageView *lightingView;

@end

@implementation GGLuckyChooseController

- (IBAction)didClickDreamChoose:(UIButton *)sender {
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置跑马灯效果
    self.lightingView.animationImages = @[[UIImage imageNamed:@"lucky_entry_light0"],[UIImage imageNamed:@"lucky_entry_light1"]];
    self.lightingView.animationDuration = 0.2;
    self.lightingView.animationRepeatCount = 0;
    [self.lightingView startAnimating];
    

 
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
