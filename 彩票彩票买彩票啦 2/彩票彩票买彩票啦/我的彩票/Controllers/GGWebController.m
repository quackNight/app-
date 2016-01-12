//
//  GGWebController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/28.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGWebController.h"
#import "GGQuestionModel.h"
@interface GGWebController ()<UIWebViewDelegate>

@end

@implementation GGWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    UIWebView *webView = (UIWebView *)self.view;
    
    //创建一个url
    NSURL *url =[[NSBundle mainBundle]URLForResource:self.question.html withExtension:nil];
    
    
    //创建一个请求对象
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    //让网页对象打开
    [webView loadRequest:urlRequest];
    
    //创建一个工具栏
    //无效
    /*
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    
    
    toolBar.barTintColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBar64"]];

    
    UIBarButtonItem *itemCancle = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(didClickBack)];
    
    toolBar.items = @[itemCancle];
    
    [self.view addSubview:toolBar];
     */
    
   
    
    
    
    
}

//弹出modal
-(void)didClickBack{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


//让视图变成webview
-(void)loadView{
    
    UIWebView *webView = [[UIWebView alloc]init];
    
    self.view = webView;
    
    webView.delegate = self;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSString *jsCode = [NSString stringWithFormat:@"document.location.href= '#%@';",self.question.ID];
    
    [webView stringByEvaluatingJavaScriptFromString:jsCode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
