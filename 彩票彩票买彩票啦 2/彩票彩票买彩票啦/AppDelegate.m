//
//  AppDelegate.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/25.
//  Copyright © 2015年 李. All rights reserved.
//

#import "AppDelegate.h"
#import "GGMainController.h"
#import "GGLaunchController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
   
    
    //新特性界面
    [self chooseLaunchScreen];
    
    
    //统一设置导航栏的背景
    [self NavigationControllerHeadColor];
    
    //显示白色的状态栏
    [self HiddenAllBarStateStyle:application];

    
    //设置为主界面窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}



-(void)NavigationControllerHeadColor{
    
    UINavigationBar *nav = [UINavigationBar appearance];
    //设置导航栏的背景图片
    [nav setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    //设置导航栏的文字
    NSDictionary *attrs=@{NSForegroundColorAttributeName :[UIColor whiteColor] };
    [nav setTitleTextAttributes:attrs];
    
    [nav setTintColor:[UIColor whiteColor]];
}

//让状态栏不隐藏
-(void)HiddenAllBarStateStyle:(UIApplication *)application{
    
    application.statusBarHidden = NO;
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
}

-(void)chooseLaunchScreen{
    
    //获取当前版本号
    NSString *current_ver = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *app_ver = [userDefaults objectForKey:@"app_ver"];
    
    
    //判断版本号是否相同，若相同，直接启动，不相同则是第一次启动，跳转到新特性启动控制器
    if ([current_ver isEqualToString:app_ver]) {
        
        GGMainController *tabbarVc = [[GGMainController alloc]init];
        
        self.window.rootViewController = tabbarVc;
        
    }else{
        
        GGLaunchController *guideVc = [[GGLaunchController alloc]init];
        
        self.window.rootViewController = guideVc;
        
      
        [userDefaults setObject:current_ver forKey:@"app_ver"];
        //同步
        [userDefaults synchronize];
    }
    
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
