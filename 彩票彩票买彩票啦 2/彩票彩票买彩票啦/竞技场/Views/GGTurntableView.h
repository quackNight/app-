//
//  GGTurntableView.h
//  幸运转盘- xxx
//
//  Created by 李 on 15/12/22.
//  Copyright © 2015年 李. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GGTurntableView;

@protocol GGTurntableViewDelegate <NSObject>

- (void)didClickButtonTurntableView:(GGTurntableView *)turntableView andAlertController:(UIAlertController *)alertCtrl;

@end

@interface GGTurntableView : UIView

+(instancetype )loadView;

//旋转
- (void)startRemota;

@property (nonatomic,weak) id<GGTurntableViewDelegate>delegate;

@end
