//
//  GGQuestionModel.h
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/28.
//  Copyright © 2015年 李. All rights reserved.
//

#import <Foundation/Foundation.h>

//"title" : "如何提现？",
//"html" : "help.html",
//"id" : "howtowithdraw"
@interface GGQuestionModel : NSObject

@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *html;
@property (nonatomic, copy)NSString *ID;


-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)questionWithDict:(NSDictionary *)dict;
@end
