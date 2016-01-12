//
//  GGAboutHeadView.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/26.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGAboutHeadView.h"

@implementation GGAboutHeadView

+(instancetype )settingHeadView{
    
    GGAboutHeadView *headView = [[[NSBundle mainBundle]loadNibNamed:@"GGAboutHeadView" owner:nil options:nil]lastObject];
    
    return headView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
