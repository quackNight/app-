//
//  GGProductShareController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/26.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGProductShareController.h"
#import "GGProductModel.h"
#import "GGProductCell.h"

@interface GGProductShareController ()

@property (nonatomic, strong)NSArray *products;

@end

@implementation GGProductShareController

static NSString * const reuseIdentifier = @"Cell";


#pragma mark  - 懒加载
-(NSArray *)products{
    
    if (_products == nil) {
        //获取路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"more_project.json" ofType:nil];
        
        NSData *jsonData = [NSData dataWithContentsOfFile:path];
        
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in jsonArray) {
            
            GGProductModel *product  = [GGProductModel productWithDict:dict];
            [tempArray addObject:product];
            
        }
        _products = tempArray.copy;
    }
    return _products;
}

#pragma mark - 设置自动布局
-(instancetype)init{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个cell的大小
    flowLayout.itemSize = CGSizeMake(80, 80);
    //最小的水平距离
    flowLayout.minimumLineSpacing = 10;
    //最小的垂直距离
    flowLayout.minimumInteritemSpacing = 0;
    //距离四周的距离
    flowLayout.sectionInset = UIEdgeInsetsMake(15, 0, 0, 0);
    
    return [self initWithCollectionViewLayout:flowLayout];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //导入xib
    [self.collectionView registerNib:[UINib nibWithNibName:@"GGProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    //设置背景颜色
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GGProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.products = self.products[indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //1、获取对应的item数据模型
    GGProductModel *product = self.products[indexPath.row];
    
    //2、获取url跟appUrl
    NSString *urlString = [NSString stringWithFormat:@"%@://%@",product.customUrl,product.url];

    NSURL *url = [NSURL URLWithString:urlString];
    NSURL *appUrl = [NSURL URLWithString:product.url];
    //3、触发事件
    UIApplication *app = [UIApplication sharedApplication];
    
    //当能打开URL的时候，直接打开，不能打开再执行括号的语句
    if (![app openURL:url]) {
        
        [app openURL:appUrl];
    }
    
    
    
    
    
    
    
    
    
}

@end
