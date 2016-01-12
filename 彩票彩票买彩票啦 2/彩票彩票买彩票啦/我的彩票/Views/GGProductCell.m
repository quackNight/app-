//
//  GGProductCell.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/28.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGProductCell.h"
#import "GGProductModel.h"

@interface GGProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelView;

@end

@implementation GGProductCell

- (void)awakeFromNib {
    // Initialization code
    self.imageView.layer.cornerRadius  = 10;
    self.imageView.layer.masksToBounds = YES;
}

-(void)setProducts:(GGProductModel *)products{
    
    _products = products;
    
    self.imageView.image = [UIImage imageNamed:products.icon];
    self.labelView.text =  products.title;
}

@end
