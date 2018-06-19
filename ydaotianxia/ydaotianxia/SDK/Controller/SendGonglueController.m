//
//  SendGonglueController.m
//  Text
//
//  Created by 顾海波 on 2018/5/14.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "SendGonglueController.h"
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

@interface SendGonglueController ()<UIActionSheetDelegate, UIScrollViewDelegate>

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

@implementation SendGonglueController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"发布攻略";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *title = [[UITextField alloc] initWithFrame:CGRectMake(5, 64, self.view.width, 50)];
    self.titleL = title;
    title.font = [UIFont systemFontOfSize:14];
    title.placeholder = @"请输入标题";
    [self.view addSubview:title];
    
    //分割线
    UIView *divisionView1 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(title.frame) - 1,  self.view.width, 1)];
    divisionView1.backgroundColor = HBRGB(245, 245, 245);
    [self.view addSubview:divisionView1];
    
    //输入框
    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    self.textView.delegate = self;
    self.textView.y = CGRectGetMaxY(divisionView1.frame);
    self.textView.height = self.view.height * 0.5;
    self.textView.placeholder = @"请输入攻略";
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
    if (self.titleL.text.length == 0) {
        return;
    }
    
    if (self.textView.text.length == 0) {
        return;
    }
    
    [MBProgressHUD showSuccess:@"发布成功"];
    
    Gonglue *g = [[Gonglue alloc] init];
    g.content = self.textView.text;
    g.title = self.titleL.text;
    g.time = @"刚刚";
    g.image = @"header3";
    g.contentImage = @"image32";
    [NewGonglueTool saving:g];
    [MyGonglueTool saving:g];
    
    [self.textView resignFirstResponder];

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) back
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
