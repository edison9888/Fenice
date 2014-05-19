//
//  CheckVersionUpdate.h
//  FurnitureShow
//
//  Created by mosh on 13-8-2.
//  Copyright (c) 2013年 cn.mosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerRequest.h"

@interface CheckVersionUpdate : NSObject

@property(nonatomic, strong) ServerRequest   *request;
@property (nonatomic ,strong) NSString      *downloadUrl;

//检查版本更新
- (void) checkVersion;

@end
