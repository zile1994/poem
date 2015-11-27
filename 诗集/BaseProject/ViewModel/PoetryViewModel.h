//
//  PoetryViewModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "PoetryModel.h"

@interface PoetryViewModel : BaseViewModel
- (id)initWithKind:(NSString *)kind;
@property(nonatomic,strong) NSString *kind;

@property(nonatomic) NSInteger rowNumber;
@property(nonatomic,strong) NSArray *poetryList;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)authorForRow:(NSInteger)row;
- (NSString *)shiForRow:(NSInteger)row;
- (NSString *)shiIntroForRow:(NSInteger)row;

@end













