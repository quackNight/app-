//
//  GGQuestionCell.h
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/28.
//  Copyright © 2015年 李. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GGQuestionModel,GGQuestionCell;

@interface GGQuestionCell : UITableViewCell

@property (nonatomic, strong)GGQuestionModel *question;


+(instancetype)initWithTableViewCell:(UITableView *)tableView;

@end
