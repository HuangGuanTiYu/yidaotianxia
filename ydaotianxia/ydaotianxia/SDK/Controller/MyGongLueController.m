//
//  MyGongLueController.m
//  Text
//
//  Created by 顾海波 on 2018/5/14.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "MyGongLueController.h"
#import "GongLueCell.h"
#import "Gonglue.h"
#import "GongLueDetailController.h"
#import "UIBarButtonItem+Extension.h"
#import "NewGonglueTool.h"
#import "MyGonglueTool.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface MyGongLueController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MyGongLueController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的攻略";

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.allowsMultipleSelectionDuringEditing = YES;
    tableView.dataSource = self;
    self.tableView = tableView;
    tableView.backgroundColor = HBRGB(242, 242, 242);
    [self.view addSubview:tableView];
    
    tableView.tableFooterView = [[UIView alloc] init];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_back@2x") target:self selector:@selector(back)];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (tableView == self.tableView) {
            [MyGonglueTool removeVideoModel:self.datas[indexPath.row]];
            [self.datas removeObjectAtIndex:indexPath.row];
            [self.tableView beginUpdates];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView endUpdates];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    self.datas = [self moments];
    [self.tableView reloadData];
}

- (void) back
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
    return [MyGonglueTool videoModels];
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
