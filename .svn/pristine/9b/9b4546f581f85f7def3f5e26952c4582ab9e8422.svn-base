//
//  ControllerFactory.h
//  moshTicket
//
//  Created by 魔时网 on 13-11-13.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalConfig.h"
#import "HTTPClient.h"
#import "BaseNavigationController.h"
#import "CollectModel.h"
#import "Store.h"

typedef enum {
    ListTypeCity,
    ListTypeStore
}ListType;

@interface ControllerFactory : NSObject

+ (UIViewController *) rootViewController;

+ (UIViewController *) storeViewController;

+ (UIViewController *) collectViewController;

+ (UIViewController *) newsViewController;

+ (UIViewController *) newsDetailViewController:(NSString *)nid;

+ (UIViewController *) silkListViewControllerWithCategroyID:(NSString *)cid;

+ (UIViewController *) textureViewControllerWithTextureModel:(silkTextureModel *)model;

+ (UIViewController *) storeListViewController:(NSDictionary *)city type:(ListType)type;

+ (UIViewController *) storeDetailViewController:(NSString *)sid;

+ (UIViewController *) storeAddressViewController:(Store *)store;

+ (UIViewController *) mapViewController:(Store *)store;
@end
