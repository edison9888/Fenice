//
//  HTTPClient.h
//  moshTickets
//
//  Created by 魔时网 on 13-11-14.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerRequest.h"   
#import "CacheHanding.h"
#import "GlobalConfig.h"
#import "UIImageView+AFNetworking.h"


@interface HTTPClient : NSObject

@property (nonatomic, strong) ServerRequest *request;

/*
 单例
 */
+ (HTTPClient *) shareHTTPClient;


/*
 添加/移除收藏
 */
- (void) addCollectWithEventID:(NSString *)eid;

- (void) removeCollectWithEventID:(NSString *)eid;





@end
