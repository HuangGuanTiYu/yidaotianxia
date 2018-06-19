//
//  HomeController.m
//  Qihuo
//
//  Created by 顾海波 on 2018/2/15.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "HomeController.h"
#import "HYTabbarView.h"
#import "FirstViewController.h"
#import "HomeDetailController.h"
#import "UIBarButtonItem+Extension.h"
#import "LeftSlideViewController.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]
#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

@interface HomeController ()<FirstViewControllerDelegate>

@property (nonatomic, strong) HYTabbarView *tabbarView;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.barTintColor = RGBCOLOR_HEX(0x549bfe);
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [navBar setTitleTextAttributes:dict];
    
    [self.view addSubview:self.tabbarView];
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:@"leftIcon" target:self selector:@selector(back)];
    
}

- (void) back
{
    
    LeftSlideViewController *LeftSlideVC = (LeftSlideViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [LeftSlideVC openLeftView];//关闭左侧抽屉
}

//懒加载
- (HYTabbarView *)tabbarView{
    
    if (!_tabbarView) {
        _tabbarView = ({
            
            HYTabbarView * tabbar = [[HYTabbarView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
            
            //传入九个控制器,每个控制器分别管理对应的视图
            FirstViewController * vc0 = [[FirstViewController alloc]init];
            vc0.title = @"最新";
            vc0.type = @"1";
            vc0.firstViewControllerDelegate = self;
            [tabbar addSubItemWithViewController:vc0];
            
            //传入九个控制器,每个控制器分别管理对应的视图
            FirstViewController * vc1 = [[FirstViewController alloc]init];
            vc1.title = @"最热";
            vc1.type = @"2";
            vc1.firstViewControllerDelegate = self;
            [tabbar addSubItemWithViewController:vc1];
            
            FirstViewController * vc2 = [[FirstViewController alloc]init];
            vc2.title = @"官网";
            vc2.type = @"3";
            vc2.firstViewControllerDelegate = self;
            [tabbar addSubItemWithViewController:vc2];
            
            FirstViewController * vc3 = [[FirstViewController alloc]init];
            vc3.title = @"新游";
            vc3.type = @"4";
            vc3.firstViewControllerDelegate = self;
            [tabbar addSubItemWithViewController:vc3];
            
            FirstViewController * vc4 = [[FirstViewController alloc]init];
            vc4.title = @"经典";
            vc4.type = @"5";
            vc4.firstViewControllerDelegate = self;
            [tabbar addSubItemWithViewController:vc4];
            
            FirstViewController * vc5 = [[FirstViewController alloc]init];
            vc5.title = @"产业";
            vc5.type = @"6";
            vc5.firstViewControllerDelegate = self;
            [tabbar addSubItemWithViewController:vc5];
            
            tabbar;
        });
    }
    return _tabbarView;
}

- (void)didselected:(NSString *)title time:(NSString *)time imageName:(NSString *)imageName des:(NSString *)des zuxun:(ZiXunModel *)zixun
{
    
    HomeDetailController *vc = [[HomeDetailController alloc] init];
    vc.topTitle = title;
    vc.time = time;
    vc.imageName = imageName;
    vc.desc = des;
    vc.model = zixun;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
