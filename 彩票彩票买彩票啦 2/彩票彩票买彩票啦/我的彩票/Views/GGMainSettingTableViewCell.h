//
//  GGMainSettingTableViewCell.h
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/26.
//  Copyright © 2015年 李. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGMainSettingTableViewCell : UITableViewCell

+(instancetype)settingCellWithtableView:(UITableView *)tableView item:(NSDictionary *)item;

-(void)setTimeWithText:(NSString *)text;

@property (nonatomic,strong)NSDictionary *item;

@end
