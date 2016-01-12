//
//  GGLiveSourceTableViewCell.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/27.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGLiveSourceTableViewCell.h"

@implementation GGLiveSourceTableViewCell

static NSString *ID = @"cell_liveScore";
//判断tableView传入的cellStyle的样式
+(instancetype)settingCellWithStyle:(NSString *)styleItem{
    
    //系统样式1
    if ([styleItem isEqualToString:@"UITableViewCellStyleValue1"]) {
        
        return [[self alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        
        //系统样式2
    }else if([styleItem isEqualToString:@"UITableViewCellStyleValue2"]){
        
        return [[self alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:ID];
        
        //加副标题的样式
    }else if([styleItem isEqualToString:@"UITableViewCellStyleSubtitle"]){
        
        return [[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }else{//默认样式

        
        return [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
}

//自定义cell
+(instancetype)settingCellWithTableView:(UITableView *)tableView withItem:(NSDictionary *)item{
    
    GGLiveSourceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [self settingCellWithStyle:item[@"cell_style"]];
    }
    //赋值
    cell.item = item;
    
    return cell;
}

-(void)setItem:(NSDictionary *)item{
    
    _item = item;
    //设置文本
    self.textLabel.text = item[@"title"];
    //设置details
    self.detailTextLabel.text = item[@"details"];
    
    if (item[@"is_highlighted"]) {
        
        self.detailTextLabel.textColor = [UIColor redColor];
    }
    if ([item[@"accessory"] length] > 0) {
        
        UISwitch *sw = [[UISwitch alloc]init];
        self.accessoryView = sw;
    }
}



@end
