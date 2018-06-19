//
//  BookshelfCell.m
//  HBIOSFrame
//
//  Created by 顾海波 on 2018/4/19.
//  Copyright © 2018年 HB. All rights reserved.
//

#import "BookshelfCell.h"
#import "UIView+Extension.h"

#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

@implementation BookshelfCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height * 0.7)];
        _topImage.userInteractionEnabled = YES;
        _topImage.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_topImage];
        
        _botlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topImage.frame), self.width, self.height - CGRectGetMaxY(_topImage.frame))];
        
        _botlabel.textAlignment = NSTextAlignmentCenter;
        _botlabel.textColor = RGBCOLOR_HEX(0x555555);
        _botlabel.font = [UIFont systemFontOfSize:14];
        _botlabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_botlabel];
    }
    return self;
}



@end
