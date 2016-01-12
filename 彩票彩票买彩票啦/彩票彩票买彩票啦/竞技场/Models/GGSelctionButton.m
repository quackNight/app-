//
//  GGSelctionButton.m
//  幸运转盘- xxx
//
//  Created by 李 on 15/12/22.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGSelctionButton.h"

@implementation GGSelctionButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    return CGRectMake((contentRect.size.width - 40) *0.5, 20, 40, 47);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
