//
//  MyZixunController.m
//  Text
//
//  Created by 顾海波 on 2018/5/15.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "MyZixunController.h"
#import "HomeFirstCell.h"
#import "HomeSecondCell.h"
#import "ZiXunModel.h"
#import "HomeDetailController.h"
#import "UIView+Extension.h"
#import "ZiXunModelTool.h"
#import "UIBarButtonItem+Extension.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface MyZixunController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) NSArray *imageNames;

@property (nonatomic, strong) NSArray *times;

@property (nonatomic, strong) NSArray *decs;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MyZixunController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"我的资讯";
    
    NSArray *dataArray = [ZiXunModelTool videoModels];
    self.dataArray = dataArray;
    ZiXunModel *first = [dataArray firstObject];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.height = self.view.height - 64 - 100;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];
        
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_back@2x") target:self selector:@selector(back)];
}

- (void) back
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZiXunModel *model = self.dataArray[indexPath.row];
    
    if (model.subImage1.length > 0) {
        static NSString *ID = @"HomeSecondCell";
        HomeSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[HomeSecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.title = model.title;
        cell.time = model.time;
        cell.imageNames = @[model.subImage1,model.subImage2,model.subImage3];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else
    {
        static NSString *ID = @"HomeFirstCell";
        HomeFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[HomeFirstCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.title = model.title;
        cell.time = model.time;
        cell.imageName = model.image;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZiXunModel *model = self.dataArray[indexPath.row];

    if (model.subImage1.length > 0) {
        return 160;
    }
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZiXunModel *model = self.dataArray[indexPath.row];

    HomeDetailController *vc = [[HomeDetailController alloc] init];
    vc.topTitle = model.title;
    vc.time = model.time;
    vc.imageName = model.image;
    vc.desc = model.content;
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
