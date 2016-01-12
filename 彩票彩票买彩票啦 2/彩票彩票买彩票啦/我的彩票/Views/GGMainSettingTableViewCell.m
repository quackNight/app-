//
//  GGMainSettingTableViewCell.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/26.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGMainSettingTableViewCell.h"



@implementation GGMainSettingTableViewCell



static NSString *ID = @"cell_style";
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
+(instancetype)settingCellWithtableView:(UITableView *)tableView item:(NSDictionary *)item{
 
    GGMainSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [self settingCellWithStyle:item[@"cell_style"]];
    }
    //赋值
    cell.item = item;
    
    return cell;
}

-(void)setItem:(NSDictionary *)item{
    
    _item = item;
    //设置表格的文本
    self.textLabel.text = item[@"title"];
    
    //设置图片
    if (item[@"icon"]) {
        
        self.imageView.image =[UIImage imageNamed:item[@"icon"]] ;
    }
    //设置描述框的文字
//    if (item[@"details"]) {
    
        self.detailTextLabel.text = item[@"details"];
//    }
    //假如是高亮的，那么就显示红色
    if (item[@"is_highlighted"]) {
        
        self.detailTextLabel.textColor = [UIColor redColor];
    }
    
    
    //添加时间选项
    if ([item[@"key_name_time"] length] > 0) {
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        
        NSString *textDetail = [userDefault objectForKey:item[@"key_name_time"]];
        
        if (textDetail.length > 0) {
            
            self.detailTextLabel.text = textDetail;
        }
        
    }

    
    
    //假如右边的描述框有值
    if ([item[@"accessory"] length] > 0 ) {
        //创建这个类
        Class AccessoryClass = NSClassFromString(item[@"accessory"]);
        id class_access = [[AccessoryClass alloc]init];
        
        if ([class_access isKindOfClass:[UIImageView class]]) {
            //假如是图片，强转后付给对应的图片
            UIImageView *imageView  = (UIImageView *)class_access;
            
            UIImage *access_img = [UIImage imageNamed:item[@"accessory_img"]];
            
            imageView.image = access_img;
            //按照图片大小适应尺寸
            [imageView sizeToFit];
        }else if ([class_access isKindOfClass:[UISwitch class]]){
            
            UISwitch *switch_access = (UISwitch *)class_access;
            
            //获取偏好设置
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            //导入开关的设置
            switch_access.on = [userDefault boolForKey:item[@"key_name"]];
           //添加开关的点击事件，让点击后的值保存到偏好设置中
            [switch_access addTarget:self action:@selector(didClickSwitch:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        self.accessoryView = class_access;
        
        
           }

    
}

//点击开关的时候触发的动作
- (void)didClickSwitch:(UISwitch *)sender{
    //获取用户偏好设置
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    //写入
    [userDefault setBool:sender.isOn forKey:self.item[@"key_name"]];
    
    //同步
    [userDefault synchronize];
    
    
}

-(void)setTimeWithText:(NSString *)text{
    
    self.detailTextLabel.text = text;
    
    if ([self.item[@"key_name_time"] length]> 0 ) {
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        
        [userDefault setObject:text forKey:self.item[@"key_name_time"]];
        
         //同步数据
         [userDefault synchronize];
    }
}

@end
