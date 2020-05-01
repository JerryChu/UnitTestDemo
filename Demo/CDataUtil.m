//
//  CDataUtil.m
//  Demo
//
//  Created by JerryChu on 2019/12/15.
//  Copyright © 2019 Chu. All rights reserved.
//

#import "CDataUtil.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation CDataUtil

/// 将数字转化为字符串
/// @discussion 大于等于10万时，展示xx万，不带小数点
/// @discussion 大于等于1万时，展示1.x万，保留一位小数点
/// @discussion 低于1万时，展示实际数字
/// @param count 数字
+ (NSString *)descForCount:(NSInteger)count {
    NSString *desc = nil;
    if (count > 99999) {
        desc = [[NSString alloc] initWithFormat:@"%@万", @(count / 10000)];
    } else if (count > 9999) {
        desc = [[NSString alloc] initWithFormat:@"%.1f万", count / 10000.f];
    } else {
        desc = [[NSString alloc] initWithFormat:@"%@", @(count)];
    }
    return desc;
}

/// 将数字转化为字符串
/// @discussion 大于等于10万时，展示xx万，不带小数点
/// @discussion 大于等于1万时，展示1.x万，保留一位小数点
/// @discussion 大于`countThreshold`时，展示实际数字
/// @discussion 小于等于`countThreshold`时，不展示
/// @param count 数字
+ (NSString *)descForCount2:(NSInteger)count {
    NSString *desc = nil;
    if (count > 99999) {
        desc = [[NSString alloc] initWithFormat:@"%@万", @(count / 10000)];
    } else if (count > 9999) {
        desc = [[NSString alloc] initWithFormat:@"%.1f万", count / 10000.f];
    } else if (count > [self countThreshold]) {
        desc = [[NSString alloc] initWithFormat:@"%@", @(count)];
    } else {
        desc = @"";
    }
    return desc;
}

// 使用依赖注入的思想，避免方法内部出现对其他方法/模块的依赖
+ (NSString *)descForCount2:(NSInteger)count withThreshold:(NSInteger)threshold {
    NSString *desc = nil;
    if (count > 99999) {
        desc = [[NSString alloc] initWithFormat:@"%@万", @(count / 10000)];
    } else if (count > 9999) {
        desc = [[NSString alloc] initWithFormat:@"%.1f万", count / 10000.f];
    } else if (count > threshold) {
        desc = [[NSString alloc] initWithFormat:@"%@", @(count)];
    } else {
        desc = @"";
    }
    return desc;
}

+ (NSInteger)countThreshold {
    return 10; // count from server
}

@end
