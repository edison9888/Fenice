//
//  AppDelegate.h
//  fenice
//
//  Created by 魔时网 on 13-11-28.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPClient.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIImageView *_animationImage;
    UIImageView *_animationLabel;
    UIView      *_animationView;
}
@property (strong, nonatomic) UIWindow  *window;
@property (strong, nonatomic) HTTPClient *client;
@end
