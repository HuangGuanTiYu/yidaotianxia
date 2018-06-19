//
//  LeftSortsViewController.m
//  LGDeckViewController
//
//  Created by jamie on 15/3/31.
//  Copyright (c) 2015年 Jamie-Ling. All rights reserved.
//

#import "LeftSortsViewController.h"
#import "otherViewController.h"
#import "LoginController.h"
#import "HBNavigationController.h"
#import "RegitstController.h"
#import "FeedbackController.h"
#import "ShoucangController.h"
#import "AboutController.h"
#import "SetUpController.h"
#import "MyGongLueController.h"
#import "MyZixunController.h"
#import "LeftSlideViewController.h"
#import "UIView_extra.h"
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

@interface LeftSortsViewController () <UITableViewDelegate,UITableViewDataSource, LoginControllerDelegate, RegitstControllerDelegate, UIActionSheetDelegate>

@property(nonatomic, strong) UIButton *loginButton;

@property(nonatomic, strong) UIButton *registButton;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIButton *outButton;

@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"leftbackiamge"];
    imageview.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageview];

    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
    UIButton *outButton = [[UIButton alloc] initWithFrame:CGRectMake(10, self.view.height - 100, self.view.width - 20, self.view.height - 100)];
    outButton.hidden = YES;
    [outButton addTarget:self action:@selector(outButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.outButton = outButton;
    [outButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [outButton setTitleColor:RGBCOLOR_HEX(0x549bfe) forState:UIControlStateNormal];
    outButton.titleLabel.font = [UIFont systemFontOfSize:25];
    tableview.tableFooterView = outButton;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"意见反馈";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"我的收藏";
    }else if (indexPath.row == 2) {
        cell.textLabel.text = @"我的攻略";
    }else if (indexPath.row == 3) {
        cell.textLabel.text = @"我的资讯";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"关于我们";
    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"设置";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LeftSlideViewController *LeftSlideVC = (LeftSlideViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [LeftSlideVC openLeftView];//关闭左侧抽屉
    
    if (indexPath.row == 0) {
        FeedbackController *vc = [[FeedbackController alloc] init];
        [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
    }else if (indexPath.row == 1) {
        ShoucangController *vc = [[ShoucangController alloc] init];
        [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
    }else if (indexPath.row == 2) {
        
        MyGongLueController *vc = [[MyGongLueController alloc] init];
        [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
    }else if (indexPath.row == 3) {
        MyZixunController *vc = [[MyZixunController alloc] init];
        [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
    }
    else if (indexPath.row == 4) {
        AboutController *vc = [[AboutController alloc] init];
        [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
    }else
    {
        SetUpController *vc = [[SetUpController alloc] init];
        [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];

    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 00, self.tableview.bounds.size.width, 150)];
    view.backgroundColor = [UIColor clearColor];
    
    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 50, 50)];
    headerView.image = [UIImage imageNamed:@"ic_userpic"];
    headerView.centerX = view.width * 0.5;
    [view addSubview:headerView];
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame) + 10, view.width * 0.5, 30)];
    self.loginButton = loginButton;
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [loginButton setTitleColor:RGBCOLOR_HEX(0x549bfe) forState:UIControlStateNormal];
    loginButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    loginButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [view addSubview:loginButton];
    
    UIButton *registButton = [[UIButton alloc] initWithFrame:CGRectMake(view.width * 0.5, 0, view.width * 0.5, 30)];
    [registButton addTarget:self action:@selector(registButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    self.registButton = registButton;
    registButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [registButton setTitleColor:RGBCOLOR_HEX(0x549bfe) forState:UIControlStateNormal];
    registButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    registButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [view addSubview:registButton];
    registButton.centerY = loginButton.centerY ;
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, view.width - 20, 30)];
    self.nameLabel = nameLabel;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.hidden = YES;
    nameLabel.centerY = registButton.centerY;
    nameLabel.textColor = RGBCOLOR_HEX(0x549bfe);
    nameLabel.font = [UIFont systemFontOfSize:25];
    [view addSubview:nameLabel];
    
    return view;
}

- (void) loginButtonClick
{
    
    LeftSlideViewController *LeftSlideVC = (LeftSlideViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [LeftSlideVC openLeftView];//关闭左侧抽屉

    LoginController *vc = [[LoginController alloc] init];
    vc.firstViewControllerDelegate = self;
    [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
}

- (void)login:(NSString *)name
{
    
    self.loginButton.hidden = self.registButton.hidden = YES;
    self.nameLabel.hidden = NO;
    self.outButton.hidden = NO;
    self.nameLabel.text = name;
}

- (void) registButtonClick
{
    
    RegitstController *vc = [[RegitstController alloc] init];
    vc.firstViewControllerDelegate = self;
    [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
}

- (void) outButtonClick
{
    
    UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"退出登录",nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        return;
    }

    LeftSlideViewController *LeftSlideVC = (LeftSlideViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [LeftSlideVC openLeftView];//关闭左侧抽屉
    
    self.loginButton.hidden = self.registButton.hidden = NO;
    self.nameLabel.hidden = YES;
    self.outButton.hidden = YES;
}

@end
