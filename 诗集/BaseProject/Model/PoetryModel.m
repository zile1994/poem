//
//  PoetryModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PoetryModel.h"

@implementation PoetryModel

+ (NSArray *)poetryListWithKind:(NSString *)kind{
    FMDatabase *db = [self defaultDatabase];
//如果数据库语句需要传参 ⬇️
    FMResultSet *rs = [db executeQueryWithFormat:@"select * from t_shi where d_kind = %@", kind];
    NSMutableArray *dataArr = [NSMutableArray new];
    while ([rs next]) {
        PoetryModel *model = [self new];
        model.kind = [rs stringForColumn:@"d_kind"];
        model.author=[rs stringForColumn:@"d_author"];
        model.title=[rs stringForColumn:@"d_title"];
        model.ID = [rs longForColumn:@"d_id"];
        model.shi = [rs stringForColumn:@"d_shi"];
        model.introShi=[rs stringForColumn:@"d_introshi"];
        [dataArr addObject:model];
    }
    [db close];
    return [dataArr copy];
}

@end










