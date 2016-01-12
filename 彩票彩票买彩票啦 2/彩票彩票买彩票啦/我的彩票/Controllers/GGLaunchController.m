//
//  GGLaunchController.m
//  彩票彩票买彩票啦
//
//  Created by 李 on 15/12/28.
//  Copyright © 2015年 李. All rights reserved.
//

#import "GGLaunchController.h"
#import "GGCollectionCell.h"

@interface GGLaunchController ()

@property (nonatomic ,weak)UIImageView *iconView;

@property (nonatomic, weak)UIImageView *largeView;

@property (nonatomic ,weak)UIImageView *smallView;

@end

@implementation GGLaunchController

//重写初始化
-(instancetype)init{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //行间距
    flowLayout.minimumLineSpacing = 0;
    //跟屏幕相等
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    
    return [super initWithCollectionViewLayout:flowLayout];
}

static NSString * const reuseIdentifier = @"Guide_Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[GGCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    

    //启用分页
    self.collectionView.pagingEnabled = YES;
    //水平方向禁止移动
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //设置弹簧
    self.collectionView.bounces = NO;
    

    
    
    
    //创建篮球图片框
    UIImageView *iconView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:iconView];
    self.iconView = iconView;

    
    //创建大文字图片框
    UIImageView *largeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    //设置frame
    CGFloat largeViewY = self.collectionView.bounds.size.height * 0.7;
    CGRect rectL= largeView.frame;
    rectL.origin.y = largeViewY;
    largeView.frame = rectL;
    
    [self.collectionView addSubview:largeView];
    self.largeView = largeView;
    
    
    
    //创建小文字图片框
    UIImageView *smallView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    //设置frame
    CGFloat smallViewY = self.collectionView.bounds.size.height * 0.8;
    CGRect rectS = smallView.frame;
    rectS.origin.y = smallViewY;
    smallView.frame = rectS;
    
    [self.collectionView addSubview:smallView];
    self.smallView = smallView;
    
    //创建线的图片框
    UIImageView *lineView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    //设置frame
    CGFloat rectLineX = -201;
    CGRect rectLine = lineView.frame;
    rectLine.origin.x = rectLineX;
    lineView.frame = rectLine;
    
    [self.collectionView addSubview:lineView];
    
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *backgroudStr = [NSString stringWithFormat:@"guide%dBackground",(int)indexPath.row +1];
    UIImage *backgroud = [UIImage imageNamed:backgroudStr];
    
    GGCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.image = backgroud;
    
    //判断是不是到最后一张，显示按钮。
    [cell setCellCount:4 compareWithindex:(int)indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

//滑动减速的时候调用
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //1、获取偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //2、移动到第几张图片
    int page = offsetX / scrollView.bounds.size.width;
    
    NSString *iconName = [NSString stringWithFormat:@"guide%d", page + 1];
    NSString *largeName = [NSString stringWithFormat:@"guideLargeText%d", page + 1];
    NSString *smallName = [NSString stringWithFormat:@"guideSmallText%d", page + 1];
    
    self.iconView.image = [UIImage imageNamed:iconName];
    self.largeView.image = [UIImage imageNamed:largeName];
    self.smallView.image = [UIImage imageNamed:smallName];
    
    
    
    CGFloat startX;
    

    //当初始化后，触发这个方法，iconView的frame为CGRectZero
    if (offsetX > self.iconView.frame.origin.x) {
        
        startX = offsetX + self.view.bounds.size.width;
    }else{
        
        startX = offsetX - self.view.bounds.size.width;
    }
    

    CGRect rectIcon = self.iconView.frame;
    rectIcon.origin.x  =startX;
    self.iconView.frame = rectIcon;
    
    CGRect rectLarge = self.largeView.frame;
    rectLarge.origin.x  =startX;
    self.largeView.frame = rectLarge;
    
    CGRect rectSmall = self.smallView.frame;
    rectSmall.origin.x  =startX;
    self.smallView.frame = rectSmall;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect rectIcon = self.iconView.frame;
        rectIcon.origin.x  =offsetX;
        self.iconView.frame = rectIcon;
        
        CGRect rectLarge = self.largeView.frame;
        rectLarge.origin.x  =offsetX;
        self.largeView.frame = rectLarge;
        
        CGRect rectSmall = self.smallView.frame;
        rectSmall.origin.x  =offsetX;
        self.smallView.frame = rectSmall;
    }];
    
}




/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
