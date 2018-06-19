//
//  GongLueDetailController.h
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/5/10.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Gonglue;

@interface GongLueDetailController : UIViewController

@property (nonatomic, copy) NSString *titleString;

@property (nonatomic, copy) NSString *time;

@property (nonatomic, copy) NSString *contentStirng;

@property (nonatomic, copy) NSString *contentImage;

@property (nonatomic, strong) Gonglue *gonglue;

@end
