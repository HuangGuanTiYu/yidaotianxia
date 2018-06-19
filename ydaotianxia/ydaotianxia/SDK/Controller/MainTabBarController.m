//
//  MainTabBarController.m
//  XiuMei
//
//  Created by edz on 2017/11/11.
//  Copyright © 2017年 xiuMie. All rights reserved.
//

#import "MainTabBarController.h"
#import "BookshelfController.h"
#import "LikeController.h"
#import "MineController.h"
#import "HBNavigationController.h"
#import "GongLueController.h"
#import "HomeController.h"
#import "SendGonglueController.h"
#import "MainTabBarView.h"
#import "SendDongtaiController.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface MainTabBarController ()<MainTabBarViewDelegate, UIActionSheetDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BookshelfController *homeVc = [[BookshelfController alloc] init];
    [self addChildViewController:homeVc title:@"首页" normalImage:ImagePath(@"ic_shouye_press")
                   selectedImage:ImagePath(@"homeIcon")];
    
    GongLueController *gongVc = [[GongLueController alloc] init];
    [self addChildViewController:gongVc title:@"攻略" normalImage:ImagePath(@"ic_gong_normal")
                   selectedImage:ImagePath(@"ic_gong_press")];

    HomeController *zixunVc = [[HomeController alloc] init];
    [self addChildViewController:zixunVc title:@"资讯" normalImage:ImagePath(@"ic_zixun_normal")
                   selectedImage:ImagePath(@"ic_zixun_press")];
    
    LikeController *circleVc = [[LikeController alloc] init];
    [self addChildViewController:circleVc title:@"动态" normalImage:ImagePath(@"ic_hangqing_press") selectedImage:ImagePath(@"ic_shouye_normal")];
    
    MainTabBarView *tabBar = [[MainTabBarView alloc] init];
    tabBar.tabbarDelegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"]; //KVC直接修改系统tabbar
}

- (void)addChildViewController:(UIViewController *)childController title : (NSString *)title normalImage : (NSString *)normalImage selectedImage : (NSString *)selectedImage
{
    childController.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",normalImage]];
    childController.title = title;
    UIImage *selected = [UIImage imageNamed:[NSString stringWithFormat:@"%@",selectedImage]];
    // 声明：这张图片按照原始的样子显示出来，不要渲染成其他的颜色（比如说默认的蓝色）
    selected = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = selected;
    childController.view.backgroundColor = HBRGB(245, 245, 245);
    HBNavigationController *hbNav = [[HBNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:hbNav];
}


- (BOOL)shouldAutorotate
{
    return NO;
}


#pragma mark 全项目支持竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void)mainTabBarViewDidClick:(MainTabBarView *)hBTabBarView
{
    
    UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"发布攻略",@"发布动态",nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 2) {
        return;
    }
    
    if (buttonIndex == 0) {
        SendGonglueController *vc = [[SendGonglueController alloc] init];;
        [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];;
    }
    
    if (buttonIndex == 1) {
        
        SendDongtaiController *vc = [[SendDongtaiController alloc] init];;
        [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];;
    }
}

@end
