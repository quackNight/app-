//
//  GGMianSettingController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/26.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGMianSettingController.h"
#import "GGMainSettingTableViewCell.h"
#import "GGUserConvertController.h"
#import "GGAboutController.h"
#import "GGProductShareController.h"
#import <MessageUI/MessageUI.h>

@interface GGMianSettingController ()

@property (nonatomic,strong)NSArray *groups;

@end

@implementation GGMianSettingController

-(BOOL)hidesBottomBarWhenPushed{
    
    return YES;
}


#pragma mark - 懒加载
-(NSArray *)groups{
    
    if (_groups ==nil) {
        
        //添加路径
        NSString *path = [[NSBundle mainBundle]pathForResource:self.plist ofType:nil];
        _groups = [NSArray arrayWithContentsOfFile:path];
    }
    return _groups;
}


//重写tableView 的style方法，让其格式变成group
-(instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}


#pragma mark - 加载视图
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //导航控制器设置返回的图片
    UIImage *backImgae = [UIImage imageNamed:@"NavBack"];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:backImgae style:UIBarButtonItemStylePlain target:self action:@selector(didPopViewControl)];
    
    //添加到左边的item中
    self.navigationItem.leftBarButtonItem = item;
}




//点击导航控制器左边item 弹出这个界面
-(void)didPopViewControl{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 数据源方法
//返回表格的组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.groups.count;
}
//返回表格的行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //    NSArray *item = self.groups[section][@"items"];
    NSDictionary *dict = self.groups[section];
    NSArray *item = dict[@"items"];
    
    return item.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //当点击的时候反选
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //获取一个组
    NSDictionary *group = self.groups[indexPath.section];
    //获取组内对应的行
    NSDictionary *item = [group[@"items"] objectAtIndex:indexPath.row];
    
    
    NSString *classVc = item[@"target_vc"];
    
    if (classVc.length > 0) {
        
        //取得目标控制器的class
        Class pushViewCtrlClass = NSClassFromString(classVc);
        //创建目标控制器
        UIViewController *viewCtrl = [[pushViewCtrlClass alloc]init];
        
        if ([viewCtrl isKindOfClass:[GGMianSettingController class]]) {
            
            GGMianSettingController *mainVc = (GGMianSettingController *)viewCtrl;
            mainVc.plist = item[@"plist_name"];
            
            
        }
        //设置导航栏的标题
        viewCtrl.navigationItem.title = item[@"title"];
        
        [self.navigationController pushViewController:viewCtrl animated:YES];
        
        //解析的方法
        /*
         //主界面样式
         if ([classVc isEqualToString:@"GGMianSettingController"]) {
         
         //创建一个控制器，重新给Plist文件，让里面的内容不一样
         GGMianSettingController *mainViewCtrl = [[GGMianSettingController alloc]init];
         mainViewCtrl.plist = item[@"plist_name"];
         
         viewCtrl = mainViewCtrl;
         
         //新建关于界面
         }else if([classVc isEqualToString:@"GGAboutController"]){
         
         GGAboutController *aboutCtrl = [[GGAboutController alloc]init];
         aboutCtrl.plist = item[@"plist_name"];
         viewCtrl = aboutCtrl;
         //产品分享界面
         }else if([classVc isEqualToString:@"GGProductShareController"]){
         
         GGProductShareController *shareCtrl = [[GGProductShareController alloc]init];
         
         shareCtrl.plist = item[@"plist_name"];
         viewCtrl = shareCtrl;
         }
         
         [self.navigationController pushViewController:viewCtrl animated:YES];
         
         */
    }
    
    
    //判断是否有方法需要执行
    if (item[@"function_name"]) {
        //将字符串转换为方法
        SEL function = NSSelectorFromString(item[@"function_name"]);
        //判断假如有方法，就执行
        if ([self respondsToSelector:function]) {
            
# pragma clang diagnostic push
# pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:function];
# pragma clang diagnostic pop
        }
    }
    
    
}


//打开appStore去评分
-(void)goToAppStore{
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/cn/app/id411654863?mt=8"];
    [[UIApplication sharedApplication] openURL:url];
}

//检查新版本触发
-(void)checkUpdate{

    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"警告⚠️" message:@"您的手机已无法支持该软件，请砸掉手机" preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alertCtrl animated:YES completion:nil];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [alertCtrl dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertCtrl addAction:action];

}

//打电话
-(void)callService{
    
//    MFMessageComposeViewController *message = [[MFMessageComposeViewController alloc]init];
//    
//    message.body = @"土豪的世界我不懂";
//    
//    message.recipients = @[@10086];
//    
//    [self presentViewController:message animated:YES completion:nil];
    
    UIApplication *app = [UIApplication sharedApplication];
    
    NSURL *url = [NSURL URLWithString:@"tel://18665889400"];
    
    [app openURL:url];
    
}


#pragma mark - tableView协议

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //获取一个组
    NSDictionary *group = self.groups[indexPath.section];
    //获取组内对应的行
    NSDictionary *item = [group[@"items"] objectAtIndex:indexPath.row];
    
    
    GGMainSettingTableViewCell *cell = [GGMainSettingTableViewCell settingCellWithtableView:tableView item:item];
    
    return cell;
}
//设置表格的页眉
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    NSDictionary *footer = self.groups[section];
    return footer[@"footer"];
}

//设置表格的页脚
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSDictionary *header = self.groups[section];
    return header[@"header"];
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
