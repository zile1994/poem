//
//  PoetryModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface PoetryModel : BaseModel

@property(nonatomic,strong) NSString *kind;
@property(nonatomic,strong) NSString *shi;
@property(nonatomic,strong) NSString *introShi;
@property(nonatomic,strong) NSString *title;
@property(nonatomic) long ID;
@property(nonatomic,strong) NSString *author;

+ (NSArray *)poetryListWithKind:(NSString *)kind;
@end














