//
//  CUserView.m
//  Demo
//
//  Created by JerryChu on 2020/5/1.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import "CUserView.h"
#import "CUserItem.h"

@interface CUserView ()

@property(nonatomic, strong) UIImageView *avatarView;
@property(nonatomic, strong) UILabel *nameLabel;

@end

@implementation CUserView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            view.layer.cornerRadius = 6.f;
            view.layer.masksToBounds = YES;
            _avatarView = view;
            view;
        })];
        [self addSubview:({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:13];
            _nameLabel = label;
            label;
        })];
    }
    return self;
}

- (void)layoutWithUserItem:(CUserItem *)userItem {
    // 拉取头像
    // [self.avatarView setImageWithURL:[NSURL URLWithString:userItem.avatrURLString]];

    // 配置姓名，长度超过限制时需要截取
    NSString *firstName = userItem.firstName;
    NSString *lastName = userItem.lastName;
    if (firstName.length > 4) {
        firstName = [firstName substringToIndex:4];
    }
    if (lastName.length > 9) {
        lastName = [lastName substringToIndex:9];
    }
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    [self.nameLabel sizeToFit];
    self.nameLabel.frame = (CGRect){CGRectGetMaxX(self.avatarView.frame), CGRectGetMinY(self.avatarView.frame), self.nameLabel.frame.size};
}

// 优化后 -- userItem实现fullName方法，或者增加ViewModel层处理fullName的计算逻辑
- (void)layoutWithUserItem2:(CUserItem *)userItem {
    // 拉取头像
    // [self.avatarView setImageWithURL:[NSURL URLWithString:userItem.avatrURLString]];

    // 配置姓名
    self.nameLabel.text = [userItem fullName];
    [self.nameLabel sizeToFit];
    self.nameLabel.frame = (CGRect){CGRectGetMaxX(self.avatarView.frame), CGRectGetMinY(self.avatarView.frame), self.nameLabel.frame.size};
}

@end
