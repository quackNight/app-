//
//  GGCollectionCell.h
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/29.
//  Copyright © 2015年 李. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGCollectionCell : UICollectionViewCell

@property (nonatomic, strong)UIImage *image;



-(void)setCellCount:(int)count compareWithindex:(int)index;

@end
