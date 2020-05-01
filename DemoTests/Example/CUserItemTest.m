//
//  CUserItemTest.m
//  DemoTests
//
//  Created by JerryChu on 2020/5/1.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CUserItem.h"

@interface CUserItemTest : XCTestCase

@end

@implementation CUserItemTest

// 正常不会被截断的场景
- (void)testBuildingFullName {
    {
        CUserItem *userItem = [CUserItem userItemWithAvatarURLString:@"" firstName:@"Jerry" lastName:@"Chu"];
        NSString *fullName = [userItem fullName];
        XCTAssertEqualObjects(fullName, @"Jerry Chu");
    }
    {
        CUserItem *userItem = [CUserItem userItemWithAvatarURLString:@"" firstName:@"Jerry" lastName:@""];
        NSString *fullName = [userItem fullName];
        XCTAssertEqualObjects(fullName, @"Jerry"); // FAILED!
    }
    {
        CUserItem *userItem = [CUserItem userItemWithAvatarURLString:@"" firstName:@"" lastName:@"Chu"];
        NSString *fullName = [userItem fullName];
        XCTAssertEqualObjects(fullName, @"Chu"); // FAILED!
    }
}

// 被截断的场景
- (void)testBuildingFullNameSliced {
    // firstName被截断
    {
        CUserItem *userItem = [CUserItem userItemWithAvatarURLString:@"" firstName:@"Jerrrrrrrrry" lastName:@"Chu"];
        NSString *fullName = [userItem fullName];
        XCTAssertEqualObjects(fullName, @"Jerrrrrrrr Chu");
    }
    // firstName被截断
    {
        CUserItem *userItem = [CUserItem userItemWithAvatarURLString:@"" firstName:@"Jerry" lastName:@"Chuuuuu"];
        NSString *fullName = [userItem fullName];
        XCTAssertEqualObjects(fullName, @"Jerry Chuuu");
    }
    // 都被截断
    {
        CUserItem *userItem = [CUserItem userItemWithAvatarURLString:@"" firstName:@"Jerrrrrrrrry" lastName:@"Chuuuuu"];
        NSString *fullName = [userItem fullName];
        XCTAssertEqualObjects(fullName, @"Jerrrrrrrr Chuuu");
    }
}


@end
