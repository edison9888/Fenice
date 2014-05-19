//
//  HTTPClient+SilkList.m
//  fenice
//
//  Created by 魔时网 on 13-12-13.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "HTTPClient+SilkList.h"
#import "SilkModel.h"

@implementation HTTPClient (SilkList)

- (void) getSilkListWithAlertView:(UIView *)view
                       categroyID:(NSString *)cid
                             page:(NSInteger)page
                             Success:(void(^)(NSArray *silkArray))success
{
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_SILKLIST,cid]
                         isAppendHost:YES
                            isEncrypt:YES
                              success:^(id jsonData){
                                  NSArray *array = [CacheHanding parseListWithDic:jsonData path:[NSString stringWithFormat:CACHE_SILKLIST,cid] key:JSONKEY];
                                  
                                 success([self converToSilkArray:array]);
                              }
                                 fail:^{
                                         NSArray *array = [CacheHanding parseListWithDic:nil path:[NSString stringWithFormat:CACHE_SILKLIST,cid] key:JSONKEY];
                                         if (array) {
                                             success([self converToSilkArray:array]);
                                         }
                                         else {
                                             success (@[]);
                                             [GlobalConfig showAlertViewWithMessage:ERROR_LOADINGFAIL superView:view];
                                             
                                         }                                     
                                 }];
}
//- (void) getSilkListWithAlertView:(UIView *)view
//                       categroyID:(NSString *)cid
//                             page:(NSInteger)page
//                          Success:(void(^)(NSArray *silkArray))success
//{
//    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_SILKLIST,cid,page]
//                         isAppendHost:YES
//                            isEncrypt:YES
//                              success:^(id jsonData){
//                                  NSArray *array = [CacheHanding parseListWithDic:jsonData path:[NSString stringWithFormat:CACHE_SILKLIST,cid] key:JSONKEY page:page];
//                                  
//                                  success([self converToSilkArray:array]);
//                              }
//                                 fail:^{
//                                     NSArray *array = [CacheHanding parseListWithDic:nil path:[NSString stringWithFormat:CACHE_SILKLIST,cid] key:JSONKEY page:page];
//                                     if (array) {
//                                         success([self converToSilkArray:array]);
//                                     }
//                                     else {
//                                         success (@[]);
//                                         [GlobalConfig showAlertViewWithMessage:ERROR_LOADINGFAIL superView:view];
//                                         
//                                     }
//                                 }];
//}
//


- (NSArray *) converToSilkArray:(NSArray *)array
{
    NSMutableArray *silkArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        NSMutableArray *categroyArray = [NSMutableArray array];
        NSString *texture = [GlobalConfig convertToString:dic[@"quality"]];
        NSString *size = [GlobalConfig convertToString:dic[@"standard"]];
        NSArray *caArray = [GlobalConfig  convertToArray:dic[@"goods"]];
        for (NSDictionary *dic2 in caArray) {
            SilkModel *model = [SilkModel silk:dic2];
            model.texture = texture;
            model.size = size;
            
            [categroyArray addObject:model];
        }
        
        [silkArray addObject:categroyArray];
    }
    
    return silkArray;
}



@end
