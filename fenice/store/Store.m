//
//  Store.m
//  fenice
//
//  Created by  evafan2003 on 13-12-16.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "Store.h"
#import "GlobalConfig.h"

@implementation Store

+ (Store *) store:(NSDictionary *)dic {
    Store *store = [[Store alloc] init];
    store.imgUrl = [NSMutableArray array];
    //赋值
    store.sid = [GlobalConfig convertToString:dic[@"id"]];
    store.title = [GlobalConfig convertToString:dic[@"name"]];
    store.city = [GlobalConfig convertToString:dic[@"city"]];
    store.address = [GlobalConfig convertToString:dic[@"address"]];
    store.loc = [GlobalConfig convertToString:dic[@"location"]];
    store.time = [GlobalConfig convertToString:dic[@"time"]];
    store.tel = [GlobalConfig convertToString:dic[@"telephone"]];

    for (NSDictionary *tmpDic in dic[@"picture"]) {
    
        [store.imgUrl addObject:[GlobalConfig convertToString:tmpDic[@"url"]]];
    }
    return store;
}

-(void) getImgArr:(NSDictionary *)dic {
    
    
}

@end
