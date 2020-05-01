//
//  CDemoUtilTest.m
//  DemoTests
//
//  Created by JerryChu on 2020/5/1.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CDemoUtil.h"
#import "OCMock.h"
#import "CUserItem.h"

@interface CDemoUtil ()

+ (void)handleLoadSuccessWithUserItem:(CUserItem *)userItem;
+ (void)handleLoadFailWithUserItem:(CUserItem *)userItem;
+ (void)showError:(BOOL)show;

@end

@interface CDemoUtilTest : XCTestCase

@end

@implementation CDemoUtilTest

// 无效的单元测试，不能直接验证异步结果
- (void)testAsyncFetchCount {
    [CDemoUtil asyncFetchCountCompletion:^(NSInteger count) {
        XCTAssertEqual(count, 0);
    }];
}

// 有效的单元测试，通过XCTestExpectation验证异步代码
- (void)testAsyncFetchCount2 {
    // 添加预期
    XCTestExpectation *expect = [self expectationWithDescription:@"asyncFetchCount"];

    [CDemoUtil asyncFetchCountCompletion:^(NSInteger count) {
        XCTAssertEqual(count, 0);
        // 通知执行完成
        [expect fulfill];
    }];
    // 开始等待并设置超时时间
    [self waitForExpectations:@[expect] timeout:1];
}

// 验证方法调用
- (void)testLoadFinish {
    // 准备mock和数据
    NSDictionary *info = @{@"avatar": @"https://avatar", @"firstName": @"Jerry", @"lastName": @"Chu"};
    id mock = OCMClassMock([CDemoUtil class]);

    // 添加预期
    OCMExpect([mock handleLoadSuccessWithUserItem:[OCMArg any]]);
    OCMReject([mock handleLoadFailWithUserItem:[OCMArg any]]);

    // 执行
    [CDemoUtil handleLoadFinished:info];

    // 验证
    OCMVerifyAll(mock);
    [mock stopMocking];
}

// 验证方法调用，同时对参数进行验证
- (void)testLoadFinishWithParamCheck {
    // 准备mock和数据
    NSDictionary *info = @{@"avatar": @"https://avatar", @"firstName": @"Jerry", @"lastName": @"Chu"};
    id mock = OCMClassMock([CDemoUtil class]);

    // 添加预期，添加参数验证
    OCMExpect([mock handleLoadSuccessWithUserItem:[OCMArg checkWithBlock:^BOOL(id obj) {
        CUserItem *item = (CUserItem *)obj;
        return [item.firstName isEqualToString:@"Jerry"];
    }]]);
    OCMReject([mock handleLoadFailWithUserItem:[OCMArg any]]);

    // 执行
    [CDemoUtil handleLoadFinished:info];

    // 验证
    OCMVerifyAll(mock);
    [mock stopMocking];
}

// 验证方法调用，同时设置调用顺序
- (void)testLoadFinishWithOrder {
    // 准备mock和数据
    NSDictionary *info = @{@"avatar": @"https://avatar", @"firstName": @"Jerry", @"lastName": @"Chu"};
    id mock = OCMClassMock([CDemoUtil class]);

    // 添加预期及执行顺序
    [mock setExpectationOrderMatters:YES];
    OCMExpect([mock handleLoadSuccessWithUserItem:[OCMArg any]]);
    OCMExpect([mock showError:YES]).ignoringNonObjectArgs;

    // 执行
    [CDemoUtil handleLoadFinished:info];

    // 验证
    OCMVerifyAll(mock);
    [mock stopMocking];
}

// 验证方法调用，忽略数值类型的参数
- (void)testLoadFinishIgnoringNonObjectArgs {
    // 准备mock和数据
    NSDictionary *info = @{@"avatar": @"https://avatar", @"firstName": @"Jerry", @"lastName": @"Chu"};
    id mock = OCMClassMock([CDemoUtil class]);

    // 添加预期及执行顺序
    [mock setExpectationOrderMatters:YES];
    OCMExpect([mock handleLoadSuccessWithUserItem:[OCMArg any]]);
    OCMExpect([mock showError:YES]).ignoringNonObjectArgs;

    // 执行
    [CDemoUtil handleLoadFinished:info];

    // 验证
    OCMVerifyAll(mock);
    [mock stopMocking];
}

// 延迟验证方法调用
- (void)testLoadFinishWithDelay {
    // 准备mock和数据
    NSDictionary *info = @{@"avatar": @"https://avatar", @"firstName": @"Jerry", @"lastName": @"Chu"};
    id mock = OCMClassMock([CDemoUtil class]);

    // 添加预期及执行顺序
    [mock setExpectationOrderMatters:YES];
    OCMExpect([mock handleLoadSuccessWithUserItem:[OCMArg any]]);
    OCMExpect([mock showError:YES]).ignoringNonObjectArgs;

    // 执行
    [CDemoUtil handleLoadFinished:info];

    // 验证
    OCMVerifyAllWithDelay(mock, 1);
    [mock stopMocking];
}


@end
