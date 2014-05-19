//
//  HTTPClient+NavTitle.m
//  fenice
//
//  Created by 魔时网 on 13-12-16.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "HTTPClient+NavTitle.h"

#define navTitleArray  @[@"News",@"Collect",@"Store"]

@implementation HTTPClient (NavTitle)

- (void) getNavTitleWithSuccess:(void (^)(NSArray *array))success
{
    [self.request beginRequestWithUrl:URL_NAVTITLE
                         isAppendHost:YES
                            isEncrypt:YES
                              success:^(id json){
                                  success([self success:json]);
                                  
                              } fail:^{
                                  success([self success:nil]);
                              }];
}

- (NSArray *) success:(NSDictionary *)dic
{
     NSArray *array = [CacheHanding parseListWithDic:dic path:CACHE_NAVTITLE key:JSONKEY];
    if (array) {
        return [self navTitle:array];
    }
    else {
        return navTitleArray;
    }
}

- (NSArray *) navTitle:(NSArray *)array
{
    NSMutableArray *muArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        NSString *title = [GlobalConfig convertToString:dic[@"title"]];
        if ([GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:title]) {
            [muArray addObject:title];
        }
    }
    if (muArray.count == 3) {
        return muArray;
    }
    else {
        return navTitleArray;
    }
}


@end
