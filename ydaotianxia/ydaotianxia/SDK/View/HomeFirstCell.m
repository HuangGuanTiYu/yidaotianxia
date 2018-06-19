//
//  HomeFirstCell.m
//  Qihuo
//
//  Created by 顾海波 on 2018/3/1.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "HomeFirstCell.h"
#import "UIView+Extension.h"
#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface HomeFirstCell ()

@property (nonatomic, strong) UIImageView *headerView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UILabel *liulanLabel;

@end

@implementation HomeFirstCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.headerView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headerView];
        
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
    
    self.headerView.frame = CGRectMake(self.width - (self.width - 40) / 3 - 10, 0, (self.width - 40) / 3, 75);
    self.headerView.centerY = self.height * 0.5;
    
    self.titleLabel.frame = CGRectMake(10, 10, self.headerView.x - 20, self.headerView.height * 0.6);
    
    self.timeLabel.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame), 50, self.headerView.height * 0.4);
    
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

- (void)setImageName:(NSString *)imageName
{
    
    _imageName = imageName;
    
    self.headerView.image = [UIImage imageNamed:ImagePath(imageName)];
    
}

@end
