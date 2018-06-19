//
//  HomeDetailController.h
//  Qihuo
//
//  Created by 顾海波 on 2018/3/1.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZiXunModel;

@interface HomeDetailController : UIViewController

@property (nonatomic, copy) NSString *topTitle;

@property (nonatomic, copy) NSString *time;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *imageName;

@property (nonatomic, strong) ZiXunModel *model;

@end
