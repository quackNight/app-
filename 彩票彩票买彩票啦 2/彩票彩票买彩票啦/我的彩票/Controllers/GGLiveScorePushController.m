//
//  GGLiveScorePushController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/27.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGLiveScorePushController.h"
#import "GGMainSettingTableViewCell.h"



@interface GGLiveScorePushController ()
//输入框
@property (nonatomic, strong)UITextField *textField;
//工具栏
@property (nonatomic, strong)UIToolbar *toolBar;
//日期选择picker
@property (nonatomic, strong)UIDatePicker *datePicker;

@property (nonatomic, strong)GGMainSettingTableViewCell *cell;

@end

@implementation GGLiveScorePushController

#pragma mark - 懒加载
-(UITextField *)textField{
    
    if (_textField ==nil) {
        
        _textField = [[UITextField alloc]init];
        _textField.inputView = self.datePicker;
        _textField.inputAccessoryView = self.toolBar;
    }
    return _textField;
}

-(UIDatePicker *)datePicker{
    
    if (_datePicker == nil) {
        
        _datePicker = [[UIDatePicker alloc]init];
        //设置语言为中文
        _datePicker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh-Hans"];
        //只弹出时间
        _datePicker.datePickerMode = UIDatePickerModeTime;
        
    }
    return _datePicker;
}

-(UIToolbar *)toolBar{
    
    if (_toolBar ==nil) {
        
        _toolBar = [[UIToolbar alloc]init];
        //设置背景颜色
        _toolBar.barTintColor = [UIColor blueColor];
        //设置行高
        _toolBar.frame = CGRectMake(0, 0, 0, 45);
        
        //取消按钮
        UIBarButtonItem *itemCancel =[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(didClickButtonCancel)];
        //完成按钮
        
        UIBarButtonItem *itemDone = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(didClickButtonDone)];
        //弹簧
        UIBarButtonItem *spring = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        _toolBar.items = @[itemCancel,spring,itemDone];
        
    }
    return _toolBar;
}

//点击取消，结束编辑
-(void)didClickButtonCancel{
    
    [self.view endEditing:YES];
    //不需要了就移除
    [self.textField removeFromSuperview];
}



//将button写入到偏好设置中，然后把值赋给文本框
-(void)didClickButtonDone{
    //获取用户选择的日期
    NSDate *date = self.datePicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"hh:mm";
    
    //开始转换
    NSString *strDate = [formatter stringFromDate:date];

    
    //把选择时间的值传给表格的cell
    [self.cell setTimeWithText:strDate];
    
    //用完就移除
    [self.textField removeFromSuperview];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (indexPath.section == 0) return;
    
    GGMainSettingTableViewCell *cell = (GGMainSettingTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    self.cell = cell;
    //把文本框加到cell中
    [cell.contentView addSubview:self.textField];
    //让文本输入变成第一响应者
    [self.textField becomeFirstResponder];
    
    
    

    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
