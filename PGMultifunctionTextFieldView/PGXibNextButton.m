//
//  PGXibNextButton.m
//  QeelinGold-iOS
//
//  Created by 张培根 on 2017/5/22.
//  Copyright © 2017年 ChenWei. All rights reserved.
//

#import "PGXibNextButton.h"
#import "UIImage+Extension.h"

@implementation PGXibNextButton

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateDisabled];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.clipsToBounds=YES;
        self.layer.cornerRadius=3;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
