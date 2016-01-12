//
//  GGQuestionCell.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/28.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGQuestionCell.h"
#import "GGQuestionModel.h"

@implementation GGQuestionCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setQuestion:(GGQuestionModel *)question{
    
    _question = question;
    
    self.textLabel.text = question.title;
    
    UIImage *accessory_img = [UIImage imageNamed:@"arrow_right"];
    UIImageView *accessory = [[UIImageView alloc]initWithImage:accessory_img];
    self.accessoryView = accessory;
}


+(instancetype)initWithTableViewCell:(UITableView *)tableView{
    
    static NSString *ID  = @"question_cell";
    
    GGQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[GGQuestionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

@end
