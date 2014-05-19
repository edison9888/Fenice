//
//  HTTPClient+Store.m
//  fenice
//
//  Created by  evafan2003 on 13-12-16.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "HTTPClient+Store.h"

@implementation HTTPClient (Store)


- (void) getStoreListWithView:(UIView *)view Sucess:(void(^)(NSMutableArray *cityArr,NSMutableArray *roundArr,NSMutableArray *storeArr))success {

    [self.request beginRequestWithUrl:URL_STORELIST
                         isAppendHost:YES
                            isEncrypt:YES
                              success:^(id json) {
                                  //转换成activityModel存入数组
                                  success([self converToNewsList:json key:@"storecity" View:view],[self converToNewsList:json key:@"turnnews" View:view],[self converToNewsList:json key:@"stores" View:view]);
                                  
                              } fail:^{
                                  success([self converToNewsList:nil key:@"storecity" View:view],[self converToNewsList:nil key:@"turnnews" View:view],[self converToNewsList:nil key:@"stores" View:view]);
                                  
                              }];
}

- (void) getStoreDetailWithId:(NSString *)nid view:(UIView *)view sucess:(void(^)(NSDictionary *store))success {

    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_STOREDETAIL,nid]
                         isAppendHost:YES
                            isEncrypt:YES
                              success:^(id json) {
                                  
                                  success([self converToStore:json View:view]);
                              } fail:^{
                                  success([self converToStore:nil View:view]);
                              }];
}


//转换成NewsModel存入数组
- (NSMutableArray *) converToNewsList:(NSDictionary *)dic key:(NSString *)key View:(UIView *)view
{
    NSMutableArray *dataArray = [NSMutableArray array];
    //缓存路径没写
    NSDictionary *jsonDic = [CacheHanding parseDetailWithDic:dic path:CACHE_STORELIST key:JSONKEY];
    
    NSMutableArray *tmpArr = [jsonDic objectForKey:key];
    
    if (tmpArr) {

        dataArray = tmpArr;
    }
    else {
        [GlobalConfig showAlertViewWithMessage:ERROR_LOADINGFAIL superView:view];
    }
    return dataArray;
}

//获取Store
- (NSDictionary *) converToStore:(NSDictionary *)dic View:(UIView *)view
{
    
    NSDictionary *jsonDic = [CacheHanding parseDetailWithDic:dic path:CACHE_STOREDETAIL key:JSONKEY];
    
    if (jsonDic) {
        return jsonDic;
    }
    else {
        [GlobalConfig showAlertViewWithMessage:ERROR_LOADINGFAIL superView:view];
    }
    return nil;
}
@end
