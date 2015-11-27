//
//  KindViewModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "KindModel.h"

@interface KindViewModel : BaseViewModel

@property(nonatomic) NSInteger rowNumber;
@property(nonatomic,strong) NSArray *kinds;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)detailForRow:(NSInteger)row;
- (BOOL)hasDetailForRow:(NSInteger)row;

@end

















