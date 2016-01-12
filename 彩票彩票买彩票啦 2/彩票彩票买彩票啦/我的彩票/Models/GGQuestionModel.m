//
//  GGQuestionModel.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/28.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGQuestionModel.h"


@implementation GGQuestionModel


-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        self.title = dict[@"title"];
        self.ID = dict[@"id"];
        self.html = dict[@"html"];
        
    }
    return self;
}


+(instancetype)questionWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
}


@end
