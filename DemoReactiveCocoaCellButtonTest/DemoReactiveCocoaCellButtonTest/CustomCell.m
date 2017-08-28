//
//  CustomCell.m
//  TestButtonInCellDemo
//
//  Created by z on 2017/8/28.
//  Copyright © 2017年 Pace.Z. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *deleteButton;

@end

@implementation CustomCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {return nil;}
    
    [self setupUI];
    RAC(self,titleLabel.text) = RACObserve(self, name);
    RAC(self,deleteButton.rac_command) = RACObserve(self, viewModel.deleteCommand);
    
    return self;
}

- (void)setupUI {
    self.titleLabel = ({
        UILabel *tmpLabel = [[UILabel alloc] init];
        tmpLabel.textColor = [UIColor blackColor];
        tmpLabel.font = [UIFont systemFontOfSize:16];
        tmpLabel.textAlignment = NSTextAlignmentCenter;
        tmpLabel;
    });

    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(self);
        make.width.mas_equalTo(100);
    }];
    
    self.deleteButton = ({
        UIButton *tmpBtn = [[UIButton alloc] init];
        [tmpBtn setTitle:@"delete" forState:UIControlStateNormal];
        [tmpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        tmpBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        tmpBtn.backgroundColor = [UIColor redColor];
        tmpBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        tmpBtn;
    });
    [self addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(self);
        make.width.mas_equalTo(100);
    }];

}
@end
