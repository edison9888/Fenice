//
//  HTTPClient+News.h
//  fenice
//
//  Created by 魔时网 on 13-12-12.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "HTTPClient.h"
#import "News.h"

@interface HTTPClient (News)

/*
 加载新闻列表
 */
- (void) getNewsListWithPage:(int)page view:(UIView *)view sucess:(void(^)(NSMutableArray *arr,NSMutableArray *roundArr))success;

- (void) getNewsDetailWithId:(NSString *)nid view:(UIView *)view sucess:(void(^)(NSDictionary *news))success;

@end
