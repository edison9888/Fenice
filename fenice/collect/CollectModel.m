//
//  CollectModel.m
//  fenice
//
//  Created by 魔时网 on 13-12-12.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "CollectModel.h"
#import "GlobalConfig.h"

@implementation CollectModel

@end


@implementation SilkSeriesModel

+ (SilkSeriesModel *) silkSeries:(NSDictionary *)dic
{
    dic = [GlobalConfig convertToDictionary:dic];
    SilkSeriesModel *series = [[SilkSeriesModel alloc] init];
    series.sid = [GlobalConfig convertToString:dic[@"id"]];
    series.title = [GlobalConfig convertToString:dic[@"title"]];
    series.imageurl = [GlobalConfig convertToString:dic[@"url"]];
    
    return series;
}

@end


@implementation silkTextureModel

+ (silkTextureModel *) silkTexture:(NSDictionary *)dic
{
    dic = [GlobalConfig convertToDictionary:dic];
    silkTextureModel *series = [[silkTextureModel alloc] init];
    series.tid = [GlobalConfig convertToString:dic[@"id"]];
    series.title = [GlobalConfig convertToString:dic[@"title"]];
    series.contentUrl = [GlobalConfig convertToString:dic[@"url"]];
    
    return series;
}

@end