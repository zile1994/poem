//
//  BaseModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

MJCodingImplementation

+ (FMDatabase *)defaultDatabase{
    static FMDatabase *db = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//数据库对象初始化，需要数据库路径
        NSString *docPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        docPath=[docPath stringByAppendingPathComponent:@"sqlite.db"];
        db = [FMDatabase databaseWithPath:docPath];
    });
//在使用对象之前，要打开数据库。
    [db open];
    return db;
}

@end












