//
//  CustomCellModel.h
//  TestButtonInCellDemo
//
//  Created by z on 2017/8/28.
//  Copyright © 2017年 Pace.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface CustomCellModel : NSObject

@property (nonatomic,strong) RACCommand *deleteCommand;

@end
