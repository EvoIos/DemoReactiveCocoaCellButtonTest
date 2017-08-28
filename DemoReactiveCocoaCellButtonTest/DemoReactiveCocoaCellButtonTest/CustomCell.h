//
//  CustomCell.h
//  TestButtonInCellDemo
//
//  Created by z on 2017/8/28.
//  Copyright © 2017年 Pace.Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "CustomCellModel.h"

@interface CustomCell : UICollectionViewCell

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) CustomCellModel *viewModel;

@end
