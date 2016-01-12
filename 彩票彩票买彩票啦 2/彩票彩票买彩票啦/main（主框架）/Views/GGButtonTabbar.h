//
//  GGButtonTabbar.h
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/25.
//  Copyright © 2015年 李. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GGButtonTabbar;

@protocol GGButtonTabbarDelegate <NSObject>

-(void)bottomBarView:(GGButtonTabbar *)buttonTabbar didClickBottomBarButtonWithIndex:(int)index;

@end

@interface GGButtonTabbar : UIView

- (void)addBottomBarButtonWithImage:(NSString *)normal selected:(NSString *)selected;


@property (nonatomic, weak)id<GGButtonTabbarDelegate>delegate;


@end
