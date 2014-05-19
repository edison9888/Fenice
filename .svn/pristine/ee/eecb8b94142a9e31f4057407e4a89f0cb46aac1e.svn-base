//
//  HTTPClient.m
//  moshTickets
//
//  Created by 魔时网 on 13-11-14.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "HTTPClient.h"
#import "News.h"

@implementation HTTPClient

+ (HTTPClient *) shareHTTPClient
{
    static HTTPClient *instace;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instace = [[HTTPClient alloc] init];
    });
    return instace;
}

- (id) init
{
    if (self = [super init]) {
        self.request = [ServerRequest serverRequest];
    }
    return self;
}


//添加收藏
- (void) addCollectWithEventID:(NSString *)eid
{
//    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@""];
    [_request beginRequestWithUrl:@"" isAppendHost:YES isEncrypt:NO success:^(id jsonData) {
        [GlobalConfig showAlertViewWithMessage:COLLECT_ADDSUCCESS superView:nil];
    } fail:^{
        [GlobalConfig showAlertViewWithMessage:COLLECT_ADDFAILED superView:nil];
    }];
}

//移除收藏
- (void) removeCollectWithEventID:(NSString *)eid
{
//    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@""];
    [_request beginRequestWithUrl:@"" isAppendHost:YES isEncrypt:NO success:^(id jsonData) {
        [GlobalConfig showAlertViewWithMessage:COLLECT_DELSUCCESS superView:nil];
    } fail:^{
        [GlobalConfig showAlertViewWithMessage:COLLECT_DELFAILED superView:nil];
    }];
}

@end
