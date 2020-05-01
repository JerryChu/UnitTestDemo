//
//  CUserItem.m
//  Demo
//
//  Created by JerryChu on 2020/5/1.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import "CUserItem.h"

@interface CUserItem ()

@property(nonatomic, copy) NSString *avatrURLString;
@property(nonatomic, copy) NSString *firstName;
@property(nonatomic, copy) NSString *lastName;

@end

@implementation CUserItem

+ (CUserItem *)userItemWithAvatarURLString:(NSString *)avatarURLString
                                 firstName:(NSString *)firstName
                                  lastName:(NSString *)lastName {
    CUserItem *item = [[CUserItem alloc] init];
    item.avatrURLString = avatarURLString;
    item.firstName = firstName;
    item.lastName = lastName;
    return item;
}

+ (CUserItem *)userItemWithInfo:(NSDictionary *)info {
    CUserItem *item = [[CUserItem alloc] init];
    item.avatrURLString = info[@"avatar"];
    item.firstName = info[@"firstName"];
    item.lastName = info[@"lastName"];;
    return item;
}

- (NSString *)fullName {
    NSString *firstName = self.firstName;
    NSString *lastName = self.lastName;
    if (firstName.length >= 10) {
        firstName = [firstName substringToIndex:10];
    }
    if (lastName.length >= 5) {
        lastName = [lastName substringToIndex:5];
    }
    return [NSString stringWithFormat:@"%@ %@", firstName, lastName];
}

- (BOOL)isValid {
    return self.avatrURLString.length > 0;
}

@end
