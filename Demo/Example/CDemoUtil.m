//
//  CDemoUtil.m
//  Demo
//
//  Created by JerryChu on 2020/5/1.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import "CDemoUtil.h"
#import "CUserItem.h"

@implementation CDemoUtil

+ (void)asyncFetchCountCompletion:(CAsyncFetchCompletionBlock)completionBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completionBlock) {
            // some random count
            NSInteger count = 1;
            completionBlock(count);
        }
    });
}

+ (void)handleLoadFinished:(NSDictionary *)info {
    CUserItem *userItem = [CUserItem userItemWithInfo:info];

    if ([userItem isValid]) {
        [self handleLoadSuccessWithUserItem:userItem];
        [self showError:NO];
    } else {
        [self handleLoadFailWithUserItem:userItem];
        [self showError:YES];
    }
}

+ (void)handleLoadSuccessWithUserItem:(CUserItem *)userItem {
}

+ (void)handleLoadFailWithUserItem:(CUserItem *)userItem {
}

+ (void)showError:(BOOL)show {
}

@end
