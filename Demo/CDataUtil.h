//
//  CDataUtil.h
//  Demo
//
//  Created by JerryChu on 2019/12/15.
//  Copyright © 2019 Chu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDataUtil : NSObject

/// 将数字转化为字符串
/// @discussion 大于等于10万时，展示xx万，不带小数点
/// @discussion 大于等于1万时，展示1.x万，保留一位小数点
/// @discussion 低于1万时，展示实际数字
/// @param count 数字
+ (NSString *)descForCount:(NSInteger)count;

/// 将数字转化为字符串
/// @discussion 大于等于10万时，展示xx万，不带小数点
/// @discussion 大于等于1万时，展示1.x万，保留一位小数点
/// @discussion 大于`countThreshold`时，展示实际数字
/// @discussion 小于等于`countThreshold`时，不展示
/// @param count 数字
+ (NSString *)descForCount2:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
