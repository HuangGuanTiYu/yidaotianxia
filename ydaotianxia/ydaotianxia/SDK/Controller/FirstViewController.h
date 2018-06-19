//
//  FirstViewController.h
//  Qihuo
//
//  Created by 顾海波 on 2018/3/1.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZiXunModel;

@protocol FirstViewControllerDelegate <NSObject>

- (void) didselected : (NSString *) title time : (NSString *) time imageName : (NSString *) imageName des : (NSString *) des zuxun : (ZiXunModel *) zixun;

@end

@interface FirstViewController : UIViewController

@property (nonatomic, weak) id<FirstViewControllerDelegate> firstViewControllerDelegate;

@property (nonatomic, copy) NSString *type;

@end
