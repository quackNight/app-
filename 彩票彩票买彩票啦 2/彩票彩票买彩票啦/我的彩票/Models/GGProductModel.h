//
//  GGProductModel.h
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/28.
//  Copyright © 2015年 李. All rights reserved.
//

#import <Foundation/Foundation.h>


//"title": "邮箱大师",
//"stitle":"网易推出的通用邮箱APP",
//"id": "com.netease.mailmaster",
//"url": "https://itunes.apple.com/cn/app/you-xiang-da-shi/id897003024?mt=8",
//"icon": "mail",
//"customUrl": "mailmaster"

@interface GGProductModel : NSObject

@property (nonatomic, copy)NSString *title;
@property (nonatomic ,copy)NSString *stitle;
@property (nonatomic ,copy)NSString *ID;
@property (nonatomic ,copy)NSString *url;
@property (nonatomic ,copy)NSString *icon;
@property (nonatomic ,copy)NSString *customUrl;



-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)productWithDict:(NSDictionary *)dict;


@end
