//
//  HTTPClient+Collect.m
//  fenice
//
//  Created by 魔时网 on 13-12-12.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "HTTPClient+Collect.h"
#import "CollectModel.h"    

@implementation HTTPClient (Collect)

- (void) getCollectInfoWithAlertView:(UIView *)view
                             Success:(void(^)(NSArray *seriesArray,NSArray *textureArray,NSString *title))success
{
    [self.request beginRequestWithUrl:URL_COLLECT
                         isAppendHost:YES
                            isEncrypt:YES
                              success:^(id jsonData){
                                  
        NSDictionary *dic = [CacheHanding parseDetailWithDic:jsonData path:CACHE_COLLECT key:JSONKEY];
        
        success([self converToSeriesArray:dic],[self converToTextureArray:dic],[GlobalConfig convertToString:dic[@"title"]]);
    }
                                 fail:^{
                                    NSDictionary *dic = [CacheHanding parseDetailWithDic:nil path:CACHE_COLLECT key:JSONKEY];
                                     if (dic) {
                                            success([self converToSeriesArray:dic],[self converToTextureArray:dic],[GlobalConfig convertToString:dic[@"title"]]);
                                     }
                                     else {
                                         success (nil,nil,nil);
                                            [GlobalConfig showAlertViewWithMessage:ERROR_LOADINGFAIL superView:view];
                                        
                                     }
    }];
}


- (NSArray *) converToSeriesArray:(NSDictionary *)dic
{
    if ([GlobalConfig isKindOfNSDictionaryClassAndCountGreaterThanZero:dic]) {
        NSArray *seriesArray = [GlobalConfig convertToArray:dic[@"series"]];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in seriesArray) {
            SilkSeriesModel *series = [SilkSeriesModel silkSeries:dic];
            [array addObject:series];
        }
        return array;
    }
    return @[];
}

- (NSArray *) converToTextureArray:(NSDictionary *)dic
{
    if ([GlobalConfig isKindOfNSDictionaryClassAndCountGreaterThanZero:dic]) {
        NSArray *seriesArray = [GlobalConfig convertToArray:dic[@"quality"]];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in seriesArray) {
            silkTextureModel *series = [silkTextureModel silkTexture:dic];
            [array addObject:series];
        }
        return array;
    }
    return @[];


}

@end
