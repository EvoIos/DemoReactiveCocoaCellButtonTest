//
//  ViewController.m
//  DemoReactiveCocoaCellButtonTest
//
//  Created by z on 2017/8/28.
//  Copyright © 2017年 Pace.Z. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *datas;
@property (nonatomic,strong) NSMutableArray *cellModels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = [@[@"Scarlet",@"Schmidt",@"Fabian",@"Fairchild",@"Fallon"] mutableCopy];
    self.cellModels = [@[] mutableCopy];
    for (int i = 0; i < self.datas.count; i++) {
        CustomCellModel *model = [CustomCellModel new];
        [self.cellModels addObject:model];
    }
    self.collectionView.hidden = NO;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    cell.name = self.datas[indexPath.row];
    cell.viewModel = self.cellModels[indexPath.row];
    
    /* there is a problem to delete data. Maybe execute twice at one tap event. */
    @weakify(self);
    @weakify(cell);
    [[cell.viewModel.deleteCommand executionSignals]
     subscribeNext:^(id x) {
         @strongify(self);
         @strongify(cell);
         NSLog(@"indexPath row: %ld, cell: %p",indexPath.row,cell);
         [self.datas removeObjectAtIndex:indexPath.row];
         [self.collectionView reloadData];
     }];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 50);
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self.view);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
        
        [_collectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:@"CustomCell"];
    }
    return _collectionView;
}

@end
