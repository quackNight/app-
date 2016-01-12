//
//  GGWebViewController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/28.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGWebViewController.h"
#import "GGQuestionModel.h"

@interface GGWebViewController ()<UIWebViewDelegate>

@end

@implementation GGWebViewController

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

    
    UIImage *backImgae = [UIImage imageNamed:@"NavBack"];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:backImgae style:UIBarButtonItemStylePlain target:self action:@selector(didClickBack)];

    self.navigationItem.rightBarButtonItem = item;


    
}

-(void)didClickBack{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
