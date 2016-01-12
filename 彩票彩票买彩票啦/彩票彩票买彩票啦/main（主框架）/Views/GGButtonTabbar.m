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

@property (nonatomic, weak)UIButton *selBtn;

@end

@implementation GGButtonTabbar

-(UIButton *)setTarBarButtonNormalImage:(NSString *)normal withSelectImage:(NSString *)sel{
    
    GGcancleLight *btn = [GGcancleLight buttonWithType:UIButtonTypeCustom];

    
    [btn setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:sel] forState:UIControlStateSelected];
    
    return btn;
}





+(UIButton *)buttonSetTarBarButtonNormalImage:(NSString *)normal withSelectImage:(NSString *)sel{
    
    return [[self alloc]setTarBarButtonNormalImage:normal withSelectImage:sel];
}



@end
