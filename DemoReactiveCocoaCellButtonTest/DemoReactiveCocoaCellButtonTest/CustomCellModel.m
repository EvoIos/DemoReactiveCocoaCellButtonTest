//
//  CustomCellModel.m
//  TestButtonInCellDemo
//
//  Created by z on 2017/8/28.
//  Copyright © 2017年 Pace.Z. All rights reserved.
//

#import "CustomCellModel.h"

@implementation CustomCellModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.deleteCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {     
                [subscriber sendNext:@YES];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return self;
}

@end
