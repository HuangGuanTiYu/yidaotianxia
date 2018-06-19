//
//  GongLueCell.m
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/5/10.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "GongLueCell.h"
#import "UIView+Extension.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface GongLueCell ()

@property (nonatomic, strong) UIImageView *headerView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIImageView *nextImage;

@end

@implementation GongLueCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.headerView = [[UIImageView alloc] init];
        self.headerView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.headerView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.titleLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textColor = HBRGB(153, 153, 153);
        [self.contentView addSubview:self.timeLabel];
        
        self.nextImage = [[UIImageView alloc] init];
        self.nextImage.image = [UIImage imageNamed:ImagePath(@"ic_next@2x")];
        [self.contentView addSubview:self.nextImage];

        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.headerView.frame = CGRectMake(10, 0, 70, 70);
    self.headerView.centerY = self.contentView.height * 0.5;
    self.headerView.layer.cornerRadius = self.headerView.width * 0.5;
    self.headerView.layer.masksToBounds = YES;
    
    CGFloat headerX = CGRectGetMaxX(self.headerView.frame) + 10;
    self.titleLabel.frame = CGRectMake(headerX, self.headerView.y - 10, self.contentView.width - headerX - 10 - 20, self.height * 0.6);
    
    self.timeLabel.frame = CGRectMake(self.titleLabel.x, CGRectGetMaxY(self.titleLabel.frame) - 10, self.titleLabel.width, self.contentView.height - CGRectGetMaxY(self.titleLabel.frame));

    self.nextImage.frame = CGRectMake(self.contentView.width - 30, 0, 20, 20);
    self.nextImage.centerY = self.height * 0.5;
}

- (void)setImageName:(NSString *)imageName
{
    
    _imageName = imageName;
    
    self.headerView.image = [UIImage imageNamed:imageName];

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
    
    [self.timeLabel sizeToFit];
}

@end
