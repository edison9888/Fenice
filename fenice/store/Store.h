//
//  Store.h
//  fenice
//
//  Created by  evafan2003 on 13-12-16.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

@property (nonatomic, strong) NSString *sid;    //ID
@property (nonatomic, strong) NSString *title;  //标题
@property (nonatomic, strong) NSString *city; //城市
@property (nonatomic, strong) NSString *address; //店铺地址
@property (nonatomic, strong) NSString *loc;   //店铺坐标
@property (nonatomic, strong) NSString *time; //营业时间
@property (nonatomic, strong) NSString *tel; //店铺电话
@property (nonatomic, strong) NSMutableArray *imgUrl; //图片
@property (nonatomic, assign) CGFloat distance; //直线距离
+ (Store *) store:(NSDictionary *)dic;

@end
