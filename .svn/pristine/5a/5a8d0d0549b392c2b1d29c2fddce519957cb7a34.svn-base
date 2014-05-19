//
//  SilkModel.m
//  fenice
//
//  Created by 魔时网 on 13-12-6.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "SilkModel.h"
#import "GlobalConfig.h"
#import "UIImageView+AFNetworking.h"

@implementation SilkModel

+ (SilkModel *) silk:(NSDictionary *)dic
{
    SilkModel *silk = [[SilkModel alloc] init];
    silk.sid = [GlobalConfig convertToString:dic[@"goodcode"]];
    silk.price = [GlobalConfig convertToString:dic[@"price"]];
    if ([GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:silk.price]) {
        silk.price = [NSString stringWithFormat:@"￥：%@",silk.price];
    }
    silk.imageUrl = [GlobalConfig convertToString:dic[@"pic"]];
    silk.pageImage = [GlobalConfig convertToString:dic[@"icon"]];
//    silk.texture = [GlobalConfig convertToString:dic[@"texture"]];
//    silk.size = [GlobalConfig convertToString:dic[@"size"]];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setImageWithURL:[NSURL URLWithString:silk.imageUrl]];
    
    UIImageView *image1 = [[UIImageView alloc] init];
    [image1 setImageWithURL:[NSURL URLWithString:silk.pageImage]];
    
    return silk;
}

@end
