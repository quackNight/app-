//
//  GGNormalQuestionController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/26.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGNormalQuestionController.h"
#import "GGQuestionModel.h"
#import "GGQuestionCell.h"
#import "GGWebController.h"
#import "GGWebViewController.h"


@interface GGNormalQuestionController ()

@property (nonatomic, strong)NSArray *questions;

@end

@implementation GGNormalQuestionController


#pragma mark - 懒加载
-(NSArray *)questions{
    
    if (_questions == nil) {
        
        NSString *jsonPath  = [[NSBundle mainBundle]pathForResource:@"help.json" ofType:nil];
        NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
        //获取json里面的数组
        NSArray *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in json) {
            
            GGQuestionModel *question = [GGQuestionModel questionWithDict:dict];
            [tempArray addObject:question];
        }
        _questions = tempArray;
    }
    return _questions;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.questions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取得对应单元格的模型
    GGQuestionModel *question = self.questions[indexPath.row];
    
    GGQuestionCell *cell =[GGQuestionCell initWithTableViewCell:tableView];
    
    
    //赋值
    cell.question = question;
    
    
    return cell;
}



#pragma mark - table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    GGWebController *webView = [[GGWebController alloc]init];
    
    
    GGQuestionModel *question = self.questions[indexPath.row];
    webView.question = question;
    
    
    [self.navigationController pushViewController:webView animated:YES];
    
   
//    UIStoryboard *webView = [UIStoryboard storyboardWithName:@"webView" bundle:nil];
//    
//    UINavigationController *nav = [webView instantiateInitialViewController];
    
  /*
    GGWebViewController *webView = [[GGWebViewController alloc]init];
    
    GGQuestionModel *question = self.questions[indexPath.row];
    
    webView.question = question;
    
    [self presentViewController:webView animated:YES completion:nil];
   
   */
 
}

@end
