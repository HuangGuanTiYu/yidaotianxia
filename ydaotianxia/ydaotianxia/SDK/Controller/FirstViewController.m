//
//  FirstViewController.m
//  Qihuo
//
//  Created by 顾海波 on 2018/3/1.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "FirstViewController.h"
#import "HomeFirstCell.h"
#import "HomeSecondCell.h"
#import "ZiXunModel.h"
#import "HomeDetailController.h"
#import "UIView+Extension.h"
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) NSArray *imageNames;

@property (nonatomic, strong) NSArray *times;

@property (nonatomic, strong) NSArray *decs;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *dataArray = [self moments];
    self.dataArray = dataArray;
    ZiXunModel *first = [dataArray firstObject];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 150)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, headerView.width, 140)];
    imageView.image = [UIImage imageNamed:ImagePath(first.banner)];
    [headerView addSubview:imageView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.height = self.view.height - 64 - 100;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    tableView.tableHeaderView = headerView;
    
    ZiXunModel *z2 = [dataArray objectAtIndex:1];
    ZiXunModel *z3 = [dataArray objectAtIndex:2];
    ZiXunModel *z4 = [dataArray objectAtIndex:3];
    ZiXunModel *z5 = [dataArray objectAtIndex:4];
    ZiXunModel *z6 = [dataArray objectAtIndex:5];
    ZiXunModel *z7 = [dataArray objectAtIndex:6];
    ZiXunModel *z8 = [dataArray objectAtIndex:7];
    
    self.titles = @[first.title, z2.title, z3.title, z4.title, z5.title, z6.title, z7.title, z8.title];

    self.times = @[first.time, z2.time, z3.time, z4.time, z5.time, z6.time, z7.time, z8.time];

    self.imageNames = @[first.image, z2.image, z3.image, z4.image, z5.image, z6.image, z7.image, z8.image];
    
    self.decs = @[first.content, z2.content, z3.content, z4.content, z5.content, z6.content, z7.content, z8.content];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZiXunModel *model = self.dataArray[indexPath.row];

    if (indexPath.row == 2 || indexPath.row == 5) {
        static NSString *ID = @"HomeSecondCell";
        HomeSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[HomeSecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.title = self.titles[indexPath.row];
        cell.time = self.times[indexPath.row];
        if (indexPath.row == 2) {
            cell.imageNames = @[model.subImage1,model.subImage2,model.subImage3];
        }else
        {
            cell.imageNames = @[model.subImage1,model.subImage2,model.subImage3];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else
    {
        static NSString *ID = @"HomeFirstCell";
        HomeFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[HomeFirstCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.title = self.titles[indexPath.row];
        cell.time = self.times[indexPath.row];
        cell.imageName = self.imageNames[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2 || indexPath.row == 5) {
        return 160;
    }
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZiXunModel *model = self.dataArray[indexPath.row];

    if ([self.firstViewControllerDelegate respondsToSelector:@selector(didselected:time:imageName:des:zuxun:)]) {
        [self.firstViewControllerDelegate didselected:self.titles[indexPath.row] time:self.times[indexPath.row] imageName:self.imageNames[indexPath.row] des:self.decs[indexPath.row] zuxun:model];
    }
}

- (NSMutableArray *)moments{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ZiXun1" ofType:@"plist"];
    
    if ([self.type isEqualToString:@"2"]) {
        path = [[NSBundle mainBundle] pathForResource:@"ZiXun2" ofType:@"plist"];
        
    }
    else if ([self.type isEqualToString:@"3"]) {
        path = [[NSBundle mainBundle] pathForResource:@"ZiXun3" ofType:@"plist"];
    }
    else if ([self.type isEqualToString:@"4"]) {
        path = [[NSBundle mainBundle] pathForResource:@"ZiXun4" ofType:@"plist"];
    }
    else if ([self.type isEqualToString:@"5"]) {
        path = [[NSBundle mainBundle] pathForResource:@"ZiXun5" ofType:@"plist"];
    }
    else if ([self.type isEqualToString:@"6"]) {
        path = [[NSBundle mainBundle] pathForResource:@"ZiXun6" ofType:@"plist"];
    }
    
    NSArray *dicArr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arr = [NSMutableArray array];
    for (NSDictionary *dic in dicArr) {
        ZiXunModel *moment = [ZiXunModel initWithDic:dic];
        [arr addObject:moment];
    }
    
    return arr;
}

@end
