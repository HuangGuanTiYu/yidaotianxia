//
//  HomeSecondCell.m
//  Qihuo
//
//  Created by 顾海波 on 2018/3/1.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "HomeSecondCell.h"
#import "UIView+Extension.h"
#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface HomeSecondCell ()

@property (nonatomic, strong) UIImageView *headerView1;

@property (nonatomic, strong) UIImageView *headerView2;

@property (nonatomic, strong) UIImageView *headerView3;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UILabel *liulanLabel;

@end

@implementation HomeSecondCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.headerView1 = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headerView1];
        
        self.headerView2 = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headerView2];
        
        self.headerView3 = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headerView3];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.titleLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = HBRGB(153, 153, 153);
        [self.contentView addSubview:self.timeLabel];
        
        self.liulanLabel = [[UILabel alloc] init];
        self.liulanLabel.font = [UIFont systemFontOfSize:12];
        self.liulanLabel.textColor = HBRGB(153, 153, 153);
        [self.contentView addSubview:self.liulanLabel];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    CGFloat headerW = (self.width - 40) / 3;
    
    self.titleLabel.frame = CGRectMake(10, 10, self.width, 30);

    self.headerView1.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame) + 10, headerW, 75);
    
    self.headerView2.frame = CGRectMake(CGRectGetMaxX(self.headerView1.frame) + 10, CGRectGetMaxY(self.titleLabel.frame) + 10, headerW, 75);
    
    self.headerView3.frame = CGRectMake(CGRectGetMaxX(self.headerView2.frame) + 10, CGRectGetMaxY(self.titleLabel.frame) + 10, headerW, 75);
    
    self.timeLabel.frame = CGRectMake(10, CGRectGetMaxY(self.headerView3.frame) + 12, 50, 10);
    
    int x = arc4random() % 10000;
    self.liulanLabel.frame = CGRectMake(CGRectGetMaxX(self.timeLabel.frame) + 10, 0, 0, 0);
    self.liulanLabel.text = [NSString stringWithFormat:@"浏览量：%d",x];
    [self.liulanLabel sizeToFit];
    self.liulanLabel.centerY = self.timeLabel.centerY;
}

- (void)setTitle:(NSString *)title
{
    
    _title = title;
    
    self.titleLabel.text = title;
}

- (void)setTime:(NSString *)time
{
    
    _time = time;
    
    self.timeLabel.text = time;
}

- (void)setImageNames:(NSArray *)imageNames
{
    
    _imageNames = imageNames;
    
    self.headerView1.image = [UIImage imageNamed:ImagePath(imageNames[0])];
    self.headerView2.image = [UIImage imageNamed:ImagePath(imageNames[1])];
    self.headerView3.image = [UIImage imageNamed:ImagePath(imageNames[2])];

}

@end
