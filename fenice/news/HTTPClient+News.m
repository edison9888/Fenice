//
//  HTTPClient+News.m
//  fenice
//
//  Created by 魔时网 on 13-12-12.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "HTTPClient+News.h"
#import "News.h"

@implementation HTTPClient (News)

/*
 加载新闻列表
 */
- (void) getNewsListWithPage:(int)page view:(UIView *)view sucess:(void(^)(NSMutableArray *arr,NSMutableArray *roundArr))success {
    
    //url没写
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_NEWS,page]
                         isAppendHost:YES
                            isEncrypt:YES
                              success:^(id json) {
                                  //转换成activityModel存入数组
                                  success([self converToNewsList:json page:page key:@"news" view:view],[self converToNewsList:json page:page key:@"turnnews" view:view]);
                                  
                              } fail:^{
                                  success([self converToNewsList:nil page:page key:@"news" view:view],[self converToNewsList:nil page:page key:@"turnnews" view:view]);
                                  
                              }];
}

/*
 加载新闻详情
 */
- (void) getNewsDetailWithId:(NSString *)nid view:(UIView *)view sucess:(void(^)(NSDictionary *news))success {
    
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_NEWSDETAIL,nid]
                         isAppendHost:YES
                            isEncrypt:YES
                              success:^(id json){
                                  
                                  success([self converToNews:json view:view nid:nid]);
                                  
                              }
                                 fail:^{
                                     
                                  success([self converToNews:nil view:view nid:nid]);
                                     
                                 }];
    
    
}


//转换成NewsModel存入数组
- (NSMutableArray *) converToNewsList:(NSDictionary *)dic page:(int)page key:(NSString *)key view:(UIView *)view
{
    NSMutableArray *dataArray = [NSMutableArray array];

    //缓存路径没写
    NSDictionary *jsonDic = [CacheHanding parseDetailWithDic:dic path:CACHE_NEWSLIST key:JSONKEY];

    dataArray = [jsonDic objectForKey:key];
    
    if (!dataArray) {

        [GlobalConfig showAlertViewWithMessage:ERROR_LOADINGFAIL superView:view];
    }

    return dataArray;
}

//转换成activityModel存入数组
- (NSDictionary *) converToNews:(NSDictionary *)dic view:(UIView *)view nid:(NSString *)nid
{
    //缓存路径没写
    NSDictionary *jsonDic = [CacheHanding parseDetailWithDic:dic path:[NSString stringWithFormat:CACHE_NEWSDETAIL,nid] key:JSONKEY];
    
    if (jsonDic) {
        return jsonDic;
    }
    else {
        [GlobalConfig showAlertViewWithMessage:ERROR_LOADINGFAIL superView:view];
    }
    return nil;
}

@end
