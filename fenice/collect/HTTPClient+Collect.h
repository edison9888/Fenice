//
//  HTTPClient+Collect.h
//  fenice
//
//  Created by 魔时网 on 13-12-12.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "HTTPClient.h"

@interface HTTPClient (Collect)

//加载collect信息
- (void) getCollectInfoWithAlertView:(UIView *)view
                             Success:(void(^)(NSArray *seriesArray,NSArray *textureArray,NSString *title))success;

@end
