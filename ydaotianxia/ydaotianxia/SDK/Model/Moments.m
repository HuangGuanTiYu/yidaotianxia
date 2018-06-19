//
//  Moments.m
//  SoolyMomentCell
//
//  Created by SoolyChristina on 2016/11/25.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import "Moments.h"
#import "MomentsTool.h"
#import "MJExtension.h"

@implementation Moments

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        //KVC赋值
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)initWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

MJCodingImplementation

+(NSMutableArray *)moments{
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/Moments.plist"];
    NSArray *dicArr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arr = [NSMutableArray array];
    for (NSDictionary *dic in dicArr) {
        Moments *moment = [Moments initWithDic:dic];
        [arr addObject:moment];
    }
    
    NSArray *array = [MomentsTool videoModels];
    if (array.count > 0) {
        for (Moments *m in array) {
            [arr addObject:m];
        }
    }
    return arr;
}


@end
