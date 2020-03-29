//
//  CDataUtilTest2.m
//  DemoTests
//
//  Created by JerryChu on 2019/12/15.
//  Copyright © 2019 Chu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CDataUtil.h"
#import "OCMock.h"

@interface CDataUtil ()

+ (NSInteger)countThreshold;

@end


@interface CDataUtilTest2: XCTestCase

@property(nonatomic, strong) id mock;

@end

@implementation CDataUtilTest2

- (void)setUp {
    _mock = OCMClassMock([CDataUtil class]);
    OCMStub([_mock countThreshold]).andReturn(0);
}

- (void)tearDown {
    [_mock stopMocking];
}

- (void)testDescForCount {
    NSInteger count = 100;
    NSString *desc = [CDataUtil descForCount2:count];
    XCTAssertEqualObjects(desc, @"100");
}

@end






//
//- (void)testDescForCount {
//    // 准备
//    NSInteger count = 0;
//    // 调用
//    NSString *desc = [CDataUtil descForCount2:count];
//    // 断言
//    XCTAssertEqualObjects(desc, @"0");
//}
//
//- (void)testDescForNonNegativeCount {
//    {
//        NSInteger count = 0;
//        NSString *desc = [CDataUtil descForCount2:count];
//        XCTAssertEqualObjects(desc, @"0");
//    }
//    {
//        NSInteger count = 1;
//        NSString *desc = [CDataUtil descForCount2:count];
//        XCTAssertEqualObjects(desc, @"1");
//    }
//    {
//        NSInteger count = 100;
//        NSString *desc = [CDataUtil descForCount2:count];
//        XCTAssertEqualObjects(desc, @"100");
//    }
//}
//
//- (void)testDescForNegativeCount {
//    {
//        NSInteger count = -1;
//        NSString *desc = [CDataUtil descForCount2:count];
//        XCTAssertEqualObjects(desc, @"");
//    }
//    {
//        NSInteger count = -100;
//        NSString *desc = [CDataUtil descForCount2:count];
//        XCTAssertEqualObjects(desc, @"");
//    }
//}
//
//- (void)testDescForSpecialCount {
//    {
//        NSInteger count = 9999;
//        NSString *desc = [CDataUtil descForCount2:count];
//        XCTAssertEqualObjects(desc, @"9999");
//    }
//    {
//        NSInteger count = 10000;
//        NSString *desc = [CDataUtil descForCount2:count];
//        XCTAssertEqualObjects(desc, @"1.0万");
//    }
//    {
//        NSInteger count = 99999;
//        NSString *desc = [CDataUtil descForCount2:count];
//        XCTAssertEqualObjects(desc, @"10.0万");
//    }
//    {
//        NSInteger count = 100000;
//        NSString *desc = [CDataUtil descForCount2:count];
//        XCTAssertEqualObjects(desc, @"10万");
//    }
//}
//
