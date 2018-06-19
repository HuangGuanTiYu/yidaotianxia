//
//  HomeDetailController.m
//  Qihuo
//
//  Created by 顾海波 on 2018/3/1.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "HomeDetailController.h"
#import "UIView+Extension.h"
#import "UIBarButtonItem+Extension.h"
#import "MBProgressHUD+MJ.h"
#import "ZiXunModel.h"
#import "ZiXunModelTool.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface HomeDetailController ()<UIActionSheetDelegate>

@end

@implementation HomeDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"资讯详情";
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.view.width - 20, 30)];
    title.numberOfLines = 0;
    title.text = self.topTitle;
    title.font = [UIFont systemFontOfSize:18];
    title.numberOfLines = 0;
    [scrollView addSubview:title];
    
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(title.frame) + 10, self.view.width - 20, 30)];
    time.textColor = HBRGB(153, 153, 153);
    time.numberOfLines = 0;
    time.text = self.time;
    [time sizeToFit];
    time.font = [UIFont systemFontOfSize:14];
    time.numberOfLines = 0;
    [scrollView addSubview:time];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(time.frame) + 10, self.view.width - 20, 210)];
    imageView.image = [UIImage imageNamed:ImagePath(self.imageName)];
    [scrollView addSubview:imageView];

    UILabel *desc = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imageView.frame), self.view.width - 20, 0)];
    desc.numberOfLines = 0;
    desc.text = self.desc;
    [desc sizeToFit];
    desc.font = [UIFont systemFontOfSize:14];
    desc.numberOfLines = 0;
    [scrollView addSubview:desc];
    
    scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(desc.frame) + 10);
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:@"more" target:self selector:@selector(back)];

}

- (void) back
{
    
    UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"收藏",@"举报",nil];
    actionSheet.tag = 0;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (actionSheet.tag == 0) {
        //收藏
        if (buttonIndex == 0) {
            [MBProgressHUD showSuccess:@"收藏成功"];
            
            [ZiXunModelTool saving:self.model];
            
        }else if (buttonIndex == 1) {
            UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:nil
                                          delegate:self
                                          cancelButtonTitle:@"取消"
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:@"标题党",@"内容低俗",@"虚假欺诈",@"其他问题",nil];
            actionSheet.tag = 1;
            [actionSheet showInView:self.view];
        }
    }else
    {
        if (buttonIndex == 4) {
            return;
        }
        [MBProgressHUD showSuccess:@"举报成功"];
    }

}


@end
