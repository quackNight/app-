//
//  GGTurntableView.m
//  幸运转盘- xxx
//
//  Created by 李 on 15/12/22.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGTurntableView.h"
#import "GGSelctionButton.h"

#define COUNT 12

@interface GGTurntableView ()

@property (nonatomic, strong)NSArray *buttons;
@property (weak, nonatomic) IBOutlet UIImageView *imageWheelView;

@property (nonatomic, weak)UIButton *selcetedButton;

@property (nonatomic, weak) CADisplayLink *link;



@end

@implementation GGTurntableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype )loadView{
    
    GGTurntableView *turntableView = [[NSBundle mainBundle]loadNibNamed:@"GGTurntable" owner:nil options:nil].lastObject;
    
    return turntableView;
}


#pragma mark - 懒加载
-(NSArray *)buttons {
    if (_buttons == nil) {
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (int i = 0; i <COUNT ; i ++) {
            
             GGSelctionButton *button = [GGSelctionButton buttonWithType:UIButtonTypeCustom];
            button.tag = i;
            //设置被选中状态下的图片
            [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
            
            //设置按钮偏转
            CGFloat angle = M_PI *2 / COUNT;
            button.transform = CGAffineTransformMakeRotation(angle *i);
            
            //设置按钮的单击事件
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            
            
            button.layer.anchorPoint = CGPointMake(0.5, 1);

            
            UIImage *normalImage = [UIImage imageNamed:@"LuckyAstrology"];
            UIImage *pressImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
            
            
            //设置选中状态下的文字（截取的图片）
            UIImage *imageClipeNormal = [self LuckyAstrologyWithOrigonImg:normalImage andIndex:i];
            UIImage *imageClipeSelected = [self LuckyAstrologyWithOrigonImg:pressImage andIndex:i];
            
            [button setImage:imageClipeNormal forState:UIControlStateNormal];
            [button setImage:imageClipeSelected forState:UIControlStateSelected];
            
            [tempArray addObject:button];
         
            [self.imageWheelView addSubview:button];
        }
        _buttons = tempArray;
    }
    return _buttons;
}
- (IBAction)didClickButton:(UIButton *)sender {
    
    //选择按钮后关闭用户交互功能
    self.imageWheelView.userInteractionEnabled = NO;
    //关闭循环
    [self.link invalidate];
    
    //选中按钮偏转角度
    CGFloat angle =M_PI * 2 * 10 - M_PI * 2 / COUNT * self.selcetedButton.tag;
    
    CABasicAnimation *basic =[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    basic.toValue = @(angle);
    basic.duration = 2;
    basic.delegate = self;
    
    [self.imageWheelView.layer addAnimation:basic forKey:@"basic"];
    
    
    
    }

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    //选中按钮偏转角度
    CGFloat angle =M_PI * 2 * 10 - M_PI * 2 / COUNT * self.selcetedButton.tag;
    
    self.imageWheelView.transform = CGAffineTransformMakeRotation(angle);
    
    //延时操作
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([self.delegate respondsToSelector:@selector(didClickButtonTurntableView:andAlertController:)]) {
            
            UIAlertController *alertctrl = [UIAlertController alertControllerWithTitle:@"今晚翻的牌子是：" message:@"3号" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"就是她了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                self.imageWheelView.userInteractionEnabled = YES;
                //继续旋转
                [self startRemota];
            }];
            
            [alertctrl addAction:action];
            
            [self.delegate didClickButtonTurntableView:self andAlertController:alertctrl];
        }
    });

    
    
    
}

//加载一个图片视角
-(UIImage *)LuckyAstrologyWithOrigonImg:(UIImage *)origon andIndex:(int )index{
    
    
    CGFloat w = 40;
    CGFloat h = 47;
    CGFloat x = index * w;
    CGFloat y = 0;
    
    CGFloat scale = [UIScreen mainScreen].scale;
    
    w *= scale;
    h *= scale;
    x *= scale;
    y *= scale;
    
    
    CGRect clipedRect = CGRectMake(x ,y ,w ,h);
    CGImageRef clipe = CGImageCreateWithImageInRect(origon.CGImage, clipedRect);
    
    return [UIImage imageWithCGImage:clipe];

}


-(void)clickButton:(UIButton *)sender{
    
    //将原先的选中状态清空
    self.selcetedButton.selected = NO;
    
    
    self.selcetedButton = sender;
    
    //将选中按钮设为选中状态
    sender.selected = YES;
    
    
    
}

//创建视图
-(void)layoutSubviews{
    
    for (int i = 0; i <self.buttons.count; i ++) {
        
        UIButton *button = self.buttons[i];
        
        button.center = self.imageWheelView.center;
        button.bounds = CGRectMake(0, 0, 66, 143);
    }
}


//旋转
-(void)startRemota{
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(remotation)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    self.link = link;
}
//旋转
-(void)remotation{
    
    self.imageWheelView.transform = CGAffineTransformRotate(self.imageWheelView.transform, M_PI * 0.0045 * 0.5);
}

@end
