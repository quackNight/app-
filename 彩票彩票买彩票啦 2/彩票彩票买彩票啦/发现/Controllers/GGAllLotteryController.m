//
//  GGAllLotteryController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/26.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGAllLotteryController.h"

@interface GGAllLotteryController ()

@property (nonatomic, strong)UIView *redView;

@end


@implementation GGAllLotteryController

-(UIView *)redView{
    
    if (_redView == nil) {
        
        _redView = [[UIView alloc]init];
        _redView.backgroundColor = [UIColor redColor];
        
        CGFloat w = self.view.frame.size.width;
        CGFloat x = 0;
        CGFloat y = 64;
        CGFloat h = 0;
        
        _redView.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:_redView];
    }
    return _redView;
}
- (IBAction)didClickButton:(UIButton *)sender {

    
    [self redView];
    
    [UIView animateWithDuration:0.1 animations:^{
        //翻转
        sender.imageView.transform = CGAffineTransformRotate(sender.imageView.transform, M_PI);
        
        if (self.redView.frame.size.height == 0) {
            
            CGRect redFrame = self.redView.frame;
            redFrame.size.height = 100;
            self.redView.frame = redFrame;
            
        }else{
            
            CGRect redFrame = self.redView.frame;
            redFrame.size.height = 0;
            self.redView.frame = redFrame;
        }
    }];
    
    
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
