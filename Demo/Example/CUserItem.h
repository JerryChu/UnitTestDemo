//
//  CUserItem.h
//  Demo
//
//  Created by JerryChu on 2020/5/1.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 用户model
@interface CUserItem : NSObject

@property(nonatomic, copy, readonly) NSString *avatrURLString;
@property(nonatomic, copy, readonly) NSString *firstName;
@property(nonatomic, copy, readonly) NSString *lastName;

/// 创建用户
/// @param avatarURLString 头像url
/// @param firstName 名
/// @param lastName 姓
+ (CUserItem *)userItemWithAvatarURLString:(NSString *)avatarURLString
                                 firstName:(NSString *)firstName
                                  lastName:(NSString *)lastName;

/// 创建用户
/// @param info 用户信息
+ (CUserItem *)userItemWithInfo:(NSDictionary *)info;

/// 获取用户全名
- (NSString *)fullName;

/// 用户信息是否有效
- (BOOL)isValid;

@end

NS_ASSUME_NONNULL_END
