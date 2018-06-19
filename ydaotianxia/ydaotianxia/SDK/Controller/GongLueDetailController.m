//
//  GongLueDetailController.m
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/5/10.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "GongLueDetailController.h"
#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
#import "GonglueTool.h"
#import "Gonglue.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]
#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

@interface GongLueDetailController ()

@end

@implementation GongLueDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"攻略详情";
    
    self.view.backgroundColor = HBRGB(242, 242, 242);
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_xin_normal@2x") target:self selector:@selector(back)];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15 ,0, 0)];
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.text = self.titleString;
    [titleLabel sizeToFit];
    titleLabel.textColor = RGBCOLOR_HEX(0x333333);
    titleLabel.width = self.view.width - 30;
    [scrollView addSubview:titleLabel];
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(titleLabel.frame) + 10, 0, 0)];
    timeLabel.numberOfLines = 0;
    timeLabel.textColor = RGBCOLOR_HEX(0x888888);
    timeLabel.font = [UIFont systemFontOfSize:14];
    timeLabel.text = self.time;
    [timeLabel sizeToFit];
    [scrollView addSubview:timeLabel];
    
    UIView *sepeView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(timeLabel.frame) + 10, self.view.width, 0.5)];
    sepeView.backgroundColor = [UIColor redColor];
    sepeView.backgroundColor = RGBCOLOR_HEX(0x888888);
    [scrollView addSubview:sepeView];
    
    UIImageView *iamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(sepeView.frame) + 10, self.view.width - 30, 216)];
    iamgeView.image = [UIImage imageNamed:self.contentImage];
    [scrollView addSubview:iamgeView];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(iamgeView.frame) + 10, self.view.width - 30, 0)];
    contentLabel.numberOfLines = 0;
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.textColor = RGBCOLOR_HEX(0x666666);
    contentLabel.text = self.contentStirng;
    [contentLabel sizeToFit];
    [scrollView addSubview:contentLabel];

    scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(contentLabel.frame) + 10);
    
    BOOL hasShouCang = NO;
    
    NSArray *array = [GonglueTool videoModels];
    for (Gonglue *gong in array) {
        if ([gong.title isEqualToString:self.gonglue.title]) {
            hasShouCang = YES;
        }
    }
    
    if (hasShouCang) {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_xin_press@2x") target:self selector:@selector(back)];
        
        self.navigationItem.rightBarButtonItem.tag = 1;

    }

}

- (void) writeCommentClick
{
    
}

- (void) back
{
    
    if (self.navigationItem.rightBarButtonItem.tag == 1) {

        self.navigationItem.rightBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_xin_normal@2x") target:self selector:@selector(back)];
        self.navigationItem.rightBarButtonItem.tag = 0;
        
        [GonglueTool removeVideoModel:self.gonglue];
    }else
    {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_xin_press@2x") target:self selector:@selector(back)];
        self.navigationItem.rightBarButtonItem.tag = 1;
        
        [GonglueTool saving:self.gonglue];
    }

}

@end
