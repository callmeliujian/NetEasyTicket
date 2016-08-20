//
//  LJNewFeatureViewController.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJNewFeatureViewController.h"
#import "LJNewFeatureCell.h"

#define LJPages 4

@interface LJNewFeatureViewController ()

@property (nonatomic, assign) CGFloat lastOffsetX;

@property (nonatomic, weak) UIImageView *guideView;

@property (nonatomic, weak) UIImageView *guideLargetView;

@property (nonatomic, weak) UIImageView *guideSmallView;
@end

@implementation LJNewFeatureViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    //CollectionView必修在初始化的时候设置布局参数
    //创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //设置尺寸和布局
    layout.itemSize = LJScreenBounds.size;
    layout.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor blueColor];
    
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    
    //注册cell
    [self.collectionView registerClass:[LJNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setUpAllChildView];
}

#pragma mark - 添加所有子控件
- (void)setUpAllChildView
{
    // guide1
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    _guideView = guide;
    guide.centerX = self.view.centerX;
    
    
    [self.collectionView addSubview:guide];
    
    // guideLine
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.x -= 170;
    
    [self.collectionView addSubview:guideLine];
    
    // largerText
    UIImageView *largerText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largerText.centerX = self.view.centerX;
    largerText.centerY = self.view.height * 0.7;
    _guideLargetView = largerText;
    [self.collectionView addSubview:largerText];
    
    // smallText
    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    _guideSmallView = smallText;
    smallText.centerX = self.view.centerX;
    smallText.centerY = self.view.height * 0.8;
    [self.collectionView addSubview:smallText];
}

// 减速完成
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 获取当前x偏移量
    CGFloat curOffsetX = scrollView.contentOffset.x;
    
    // 获取差值
    CGFloat delta = curOffsetX - _lastOffsetX;
    
    _guideView.x += 2 *  delta;
    _guideLargetView.x += 2 * delta;
    _guideSmallView.x +=  2 * delta;
    
    [UIView animateWithDuration:0.25 animations:^{
        _guideView.x -=  delta;
        _guideLargetView.x -= delta;
        _guideSmallView.x -=   delta;
    }];
    
    int page = curOffsetX / self.view.width + 1;
    
    // 修改控件的内容
    _guideView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d",page]];
    _lastOffsetX = curOffsetX;
    
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return LJPages;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LJNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    cell.image = [UIImage imageNamed:imageName];
    
    //最后一个cell添加button
    [cell setUpIndexPath:indexPath count:LJPages];
    
    return cell;
}

@end
