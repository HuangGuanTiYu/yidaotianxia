//
//  GongLueController.m
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/5/10.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "GongLueController.h"
#import "GongLueCell.h"
#import "Gonglue.h"
#import "GongLueDetailController.h"
#import "UIBarButtonItem+Extension.h"
#import "NewGonglueTool.h"
#import "LeftSlideViewController.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface GongLueController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GongLueController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    tableView.backgroundColor = HBRGB(242, 242, 242);
    [self.view addSubview:tableView];
    
    tableView.tableFooterView = [[UIView alloc] init];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:@"leftIcon" target:self selector:@selector(back)];

}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    self.datas = [self moments];
    [self.tableView reloadData];
}

- (void) back
{
    
    LeftSlideViewController *LeftSlideVC = (LeftSlideViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [LeftSlideVC openLeftView];//关闭左侧抽屉
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.datas.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Gonglue *g = self.datas[indexPath.row];
    
    static NSString *ID = @"GongLueCell";
    GongLueCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[GongLueCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.imageName = ImagePath(g.image);
    cell.title = g.title;
    cell.time = g.time;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
}

- (NSMutableArray *)moments{
    
    return [NewGonglueTool videoModels];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    Gonglue *g = self.datas[indexPath.row];

    GongLueDetailController *vc = [[GongLueDetailController alloc] init];
    vc.titleString = g.title;
    vc.time = g.time;
    vc.contentStirng = g.content;
    vc.gonglue = g;
    vc.contentImage = ImagePath(g.contentImage);
    [self.navigationController pushViewController:vc animated:YES];
}

@end
