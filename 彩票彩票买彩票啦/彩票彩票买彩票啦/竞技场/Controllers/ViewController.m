//
//  ViewController.m
//  幸运转盘- xxx
//
//  Created by 李 on 15/12/22.
//  Copyright © 2015年 李. All rights reserved.
//

#import "ViewController.h"
#import "GGTurntableView.h"



@interface GGLuckyChangeViewController ()<GGTurntableViewDelegate>



@end

@implementation GGLuckyChangeViewController

-(void)didClickButtonTurntableView:(GGTurntableView *)turntableView andAlertController:(UIAlertController *)alertCtrl{
    
    [self presentViewController:alertCtrl animated:YES completion:nil];
}



#pragma mark - 懒加载


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"LuckyBackground"].CGImage);
    
    GGTurntableView *turntableView =  [GGTurntableView loadView];
    turntableView.delegate =self;
    
    turntableView.frame = CGRectMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5, 286, 286);
    turntableView.center = self.view.center;
    turntableView.layer.cornerRadius = turntableView.bounds.size.width * 0.5;
    turntableView.layer.masksToBounds = YES;
    
    [self.view addSubview:turntableView];
    
    
    //旋转
    [turntableView startRemota];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
