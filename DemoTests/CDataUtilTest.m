//
//  CDataUtilTest.m
//  DemoTests
//
//  Created by JerryChu on 2019/12/15.
//  Copyright © 2019 Chu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CDataUtil.h"

@interface CDataUtilTest : XCTestCase

@end

@implementation CDataUtilTest

- (void)testDescForCount {
    // 准备
    NSInteger count = 0;
    // 调用
    NSString *desc = [CDataUtil descForCount:count];
    // 断言
    XCTAssertEqualObjects(desc, @"0");
}

- (void)testDescForPositiveCount {
    {
        NSInteger count = 0;
        NSString *desc = [CDataUtil descForCount:count];
        XCTAssertEqualObjects(desc, @"0");
    }
    {
        NSInteger count = 1;
        NSString *desc = [CDataUtil descForCount:count];
        XCTAssertEqualObjects(desc, @"1");
    }
    {
        NSInteger count = 100;
        NSString *desc = [CDataUtil descForCount:count];
        XCTAssertEqualObjects(desc, @"100");
    }
}

- (void)testDescForNegativeCount {
    {
        NSInteger count = -1;
        NSString *desc = [CDataUtil descForCount:count];
        XCTAssertEqualObjects(desc, @"-1");
    }
    {
        NSInteger count = -100;
        NSString *desc = [CDataUtil descForCount:count];
        XCTAssertEqualObjects(desc, @"-100");
    }
}

- (void)testDescForSpecialCount {
    {
        NSInteger count = 9999;
        NSString *desc = [CDataUtil descForCount:count];
        XCTAssertEqualObjects(desc, @"9999");
    }
    {
        NSInteger count = 10000;
        NSString *desc = [CDataUtil descForCount:count];
        XCTAssertEqualObjects(desc, @"1.0万");
    }
    {
        NSInteger count = 99999;
        NSString *desc = [CDataUtil descForCount:count];
        XCTAssertEqualObjects(desc, @"10.0万");
    }
    {
        NSInteger count = 100000;
        NSString *desc = [CDataUtil descForCount:count];
        XCTAssertEqualObjects(desc, @"10万");
    }
}


@end


