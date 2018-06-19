//
//  ZiXunModel.h
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/5/10.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZiXunModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *time;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *subImage1;

@property (nonatomic, copy) NSString *subImage2;

@property (nonatomic, copy) NSString *subImage3;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)initWithDic:(NSDictionary *)dic;

@end
