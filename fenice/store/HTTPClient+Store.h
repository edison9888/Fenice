//
//  HTTPClient+Store.h
//  fenice
//
//  Created by  evafan2003 on 13-12-16.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "HTTPClient.h"
#import "Store.h"

@interface HTTPClient (Store)

/*
 加载新闻列表
 */
- (void) getStoreListWithView:(UIView *)view Sucess:(void(^)(NSMutableArray *arr,NSMutableArray *roundArr,NSMutableArray *storeArr))success;

- (void) getStoreDetailWithId:(NSString *)nid view:(UIView *)view sucess:(void(^)(NSDictionary *store))success;

@end
