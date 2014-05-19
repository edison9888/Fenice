//
//  ControllerFactory.m
//  moshTicket
//
//  Created by 魔时网 on 13-11-13.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "ControllerFactory.h"

#import "CollectViewController.h"
#import "NewsListViewController.h"
#import "NewsDetailViewController.h"
#import "StoreViewController.h"
#import "RootViewController.h"
#import "SilkListViewController.h"
#import "TextureViewController.h"
#import "StoreListViewController.h"
#import "StoreDetailViewController.h"
#import "StoreAddressViewController.h"
#import "MapViewController.h"

@implementation ControllerFactory

+ (UIViewController *) rootViewController
{
    return [RootViewController viewController];
}

+ (UIViewController *) collectViewController
{
    return [CollectViewController viewControllerWithNib];
}

+ (UIViewController *) newsViewController
{
    return [NewsListViewController viewController];
}


+ (UIViewController *) newsDetailViewController:(NSString *)nid
{
    return [[NewsDetailViewController alloc] initWithNid:nid];
}

+ (UIViewController *) storeViewController
{
    return [StoreViewController viewControllerWithNib];
}

+ (UIViewController *) silkListViewControllerWithCategroyID:(NSString *)cid
{
//    return [[SilkListViewController alloc] initWithCategroyID:cid];
        return [[SilkListViewController alloc] initWithNibName:NSStringFromClass([SilkListViewController class]) bundle:nil CategroyID:cid];
}

+ (UIViewController *) textureViewControllerWithTextureModel:(silkTextureModel *)model
{
//    return [[TextureViewController alloc] initWithNibName:NSStringFromClass([TextureViewController class]) bundle:nil silkTextureModel:model];
    return [[TextureViewController alloc] initWithSilkTextureModel:model];
}


//商铺列表
+ (UIViewController *) storeListViewController:(NSDictionary *)city type:(ListType)type {
    
    return [[StoreListViewController alloc] initWithCity:city type:type];
}

//商铺详情
+ (UIViewController *) storeDetailViewController:(NSString *)sid {
    
    return [[StoreDetailViewController alloc] initWithCity:sid];
}

//商铺地址
+ (UIViewController *) storeAddressViewController:(Store *)store {
    
    return [[StoreAddressViewController alloc]initWithStore:store NibName:NSStringFromClass([StoreAddressViewController class]) bundle:nil];
}

//商铺地址
+ (UIViewController *) mapViewController:(Store *)store {
    
    return [[MapViewController alloc] initWithStore:store];
}
@end
