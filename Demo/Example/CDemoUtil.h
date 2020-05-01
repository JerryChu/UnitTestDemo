//
//  CDemoUtil.h
//  Demo
//
//  Created by JerryChu on 2020/5/1.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CAsyncFetchCompletionBlock)(NSInteger);

/// 课件中实际案例演示demo
@interface CDemoUtil : NSObject

/// 异步执行获取数据
/// @param completionBlock 获取数据完成的回调
+ (void)asyncFetchCountCompletion:(CAsyncFetchCompletionBlock)completionBlock;

+ (void)handleLoadFinished:(NSDictionary *)info;

@end

NS_ASSUME_NONNULL_END
