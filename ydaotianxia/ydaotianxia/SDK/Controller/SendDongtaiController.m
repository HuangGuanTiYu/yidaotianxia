//
//  SendDongtaiController.m
//  Text
//
//  Created by 顾海波 on 2018/5/15.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "SendDongtaiController.h"
#import "MomentsTool.h"
#import "Moments.h"
#import "OrangeButton.h"
#import "UITextView+Placeholder.h"
#import "UIBarButtonItem+Extension.h"
#import "MBProgressHUD+MJ.h"
#import "NewGonglueTool.h"
#import "Gonglue.h"
#import "MyGonglueTool.h"
#import "UIView+Extension.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface SendDongtaiController ()<UIActionSheetDelegate, UIScrollViewDelegate>

//图片数组
@property(nonatomic, strong) NSMutableArray *photos;

//删除按钮数组
@property(nonatomic, strong) NSMutableArray *buttons;

//图片长宽
@property(nonatomic, assign) CGFloat photoW;

//添加图片区域
@property(nonatomic, strong) UIView *photoView;

//添加图标
@property(nonatomic, strong) UIButton *addImageView;

//tag
@property(nonatomic, assign) int photoTag;

//输入框
@property(nonatomic, strong) UITextView *textView;

//图片URL数组
@property(nonatomic, strong) NSMutableArray *imageUrls;

//提交按钮
@property(nonatomic, strong) OrangeButton * commit;

@property (nonatomic, strong) UITextField *titleL;

@end

@implementation SendDongtaiController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"发布动态";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //输入框
    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
//    self.textView.delegate = self;
    self.textView.height = self.view.height * 0.5;
    self.textView.placeholder = @"请输入动态";
    self.textView.font = [UIFont systemFontOfSize:14];
    self.textView.placeholderLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.textView];
    
    //分割线
    UIView *divisionView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textView.frame) - 1,  self.view.width, 1)];
    divisionView.backgroundColor = HBRGB(245, 245, 245);
    [self.view addSubview:divisionView];
    
    //提交
    self.commit = [OrangeButton buttonWithType:UIButtonTypeCustom];
    self.commit.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.commit addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
    self.commit.frame = CGRectMake(0, CGRectGetMaxY(divisionView.frame) + 50, self.view.width * 0.8, 50);
    self.commit.layer.cornerRadius = 25;
    self.commit.layer.masksToBounds = YES;
    self.commit.centerX = self.view.width * 0.5;
    [self.commit setTitle:@"提交" forState:UIControlStateNormal];
    [self.commit addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:self.commit];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_back@2x") target:self selector:@selector(back)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(commitClick)];
    
}

- (void) commitClick
{

    if (self.textView.text.length == 0) {
        return;
    }
    
    [MBProgressHUD showSuccess:@"发布成功"];
    
    Moments *g = [[Moments alloc] init];
    g.name = @"阅读者";
    g.icon = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526377038431&di=3415ba9af927fd1e2ed884fe67051775&imgtype=0&src=http%3A%2F%2Fwww.pkbkok.com%2Fstatics%2Fjs%2Fueditor%2Fphp%2Fuploadfile%2F20150921%2F1442829362421382.jpg";
    g.text = self.textView.text;
    g.time = @"刚刚";
    g.like_count = @"0";
    g.comment_count = @"0";
    [MomentsTool saving:g];
    
    [self.textView resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) back
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
