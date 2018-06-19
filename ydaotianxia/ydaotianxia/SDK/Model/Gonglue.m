//
//  Gonglue.m
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/5/10.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "Gonglue.h"
#import "MJExtension.h"

@implementation Gonglue

MJCodingImplementation

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


@end
