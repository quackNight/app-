//
//  GGProductModel.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/28.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGProductModel.h"

@implementation GGProductModel
//"title": "邮箱大师",
//"stitle":"网易推出的通用邮箱APP",
//"id": "com.netease.mailmaster",
//"url": "https://itunes.apple.com/cn/app/you-xiang-da-shi/id897003024?mt=8",
//"icon": "mail",
//"customUrl": "mailmaster"

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.ID = dict[@"id"];
        self.url = dict[@"url"];
        self.icon = dict[@"icon"];
        self.customUrl = dict[@"customUrl"];
    }
    return self;
}

+(instancetype)productWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
}

@end
