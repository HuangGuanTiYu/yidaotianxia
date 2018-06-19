//
//  BookshelfController.m
//  HBIOSFrame
//
//  Created by 顾海波 on 2018/4/19.
//  Copyright © 2018年 HB. All rights reserved.
//

#import "BookshelfController.h"
#import "BookshelfCell.h"
#import "DCBookModel.h"
#import "DCPageVC.h"
#import "UIView+Extension.h"
#import "BookCoverController.h"
#import "UIBarButtonItem+Extension.h"
#import "LeftSlideViewController.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface BookshelfController()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *mainCollectionView;
    
}

@property (nonatomic,strong) NSArray<DCBookModel *> *books;


@end

@implementation BookshelfController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的图书";
    
    NSMutableArray *bookArr = [NSMutableArray array];
    DCBookModel *book = [[DCBookModel alloc] init];
    
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/超级赌王.txt"];
    book.name = @"超级赌王";
    book.path = path;
    book.image = ImagePath(@"bookImage1");
    [bookArr addObject:book];
    
    DCBookModel *book1 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/马踏天下.txt"];
    book1.name = @"马踏天下";
    book1.path = path;
    book1.image = ImagePath(@"bookImage2");
    [bookArr addObject:book1];
    
    DCBookModel *book2 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/马太子.txt"];
    book2.name = @"马太子";
    book2.path = path;
    book2.image = ImagePath(@"bookImage3");
    [bookArr addObject:book2];
    
    DCBookModel *book3 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/公主的骏马.txt"];
    book3.name = @"公主的骏马";
    book3.path = path;
    book3.image = ImagePath(@"bookImage4");
    [bookArr addObject:book3];
    
    DCBookModel *book4 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/最强马神.txt"];
    book4.name = @"最强马神";
    book4.path = path;
    book4.image = ImagePath(@"bookImage5");
    [bookArr addObject:book4];
    
    DCBookModel *book5 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/赛马.txt"];
    book5.name = @"赛马";
    book5.path = path;
    book5.image = ImagePath(@"bookImage6");
    [bookArr addObject:book5];
    
    DCBookModel *book6 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/响马英雄传.txt"];
    book6.name = @"响马英雄传";
    book6.path = path;
    book6.image = ImagePath(@"bookImage7");
    [bookArr addObject:book6];
    
    DCBookModel *book7 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/星际马神.txt"];
    book7.name = @"星际马神";
    book7.path = path;
    book7.image = ImagePath(@"bookImage8");
    [bookArr addObject:book7];
    
    DCBookModel *book8 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/以赌为生.txt"];
    book8.name = @"以赌为生";
    book8.path = path;
    book8.image = ImagePath(@"bookImage9");
    [bookArr addObject:book8];
    
    DCBookModel *book9 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/重生赌石界.txt"];
    book9.name = @"重生赌石界";
    book9.path = path;
    book9.image = ImagePath(@"bookImage10");
    [bookArr addObject:book9];
    
    self.books = [NSArray arrayWithArray:bookArr];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:mainCollectionView];
    
    mainCollectionView.backgroundColor = [UIColor whiteColor];
    [mainCollectionView registerClass:[BookshelfCell class] forCellWithReuseIdentifier:@"cellId"];
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:@"leftIcon" target:self selector:@selector(back)];

}

- (void) back
{
    LeftSlideViewController *LeftSlideVC = (LeftSlideViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [LeftSlideVC openLeftView];//关闭左侧抽屉
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.books.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BookshelfCell *cell = (BookshelfCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    DCBookModel *model = self.books[indexPath.row];
    cell.botlabel.text = model.name;
    cell.topImage.image = [UIImage imageNamed:model.image];
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.view.width - 20 * 4) / 3, (self.view.width - 20 * 4) / 3 * 1.75);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    //封皮
    BookCoverController *vc = [[BookCoverController alloc] init];
    if (indexPath.row == 0) {
        vc.imageName = ImagePath(@"bj1");
    }else if (indexPath.row == 1)
    {
        vc.imageName = ImagePath(@"bj2");

    }else if (indexPath.row == 2)
    {
        vc.imageName = ImagePath(@"bj3");

    }else if (indexPath.row == 3)
    {
        vc.imageName = ImagePath(@"bj4");
        
    }else if (indexPath.row == 4)
    {
        vc.imageName = ImagePath(@"bj5");
        
    }else if (indexPath.row == 5)
    {
        vc.imageName = ImagePath(@"bj6");
        
    }else if (indexPath.row == 6)
    {
        vc.imageName = ImagePath(@"bj7");
        
    }else if (indexPath.row == 7)
    {
        vc.imageName = ImagePath(@"bj8");
        
    }else if (indexPath.row == 8)
    {
        vc.imageName = ImagePath(@"bj9");
        
    }else if (indexPath.row == 9)
    {
        vc.imageName = ImagePath(@"bj10");
        
    }
    vc.row = indexPath.row;
    vc.books = self.books;
    [self.navigationController pushViewController:vc animated:YES];
    return;

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 15;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];

}


@end
