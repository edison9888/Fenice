//
//  AppDelegate.m
//  fenice
//
//  Created by 魔时网 on 13-11-28.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "AppDelegate.h"
#import "ControllerFactory.h"

static CGFloat animationImageHeight = 33;
static CGFloat animationLabelHeight = 12;
static CGFloat animationImageDuration = 3.0f;
static CGFloat animationLabelDuration = 2.5f;
//static CGFloat animationImageDuration = 0.1f;
//static CGFloat animationLabelDuration = 0.1f;
static CGFloat animationDistance = 20;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //动画
    [self animationStart];
    
    self.window.backgroundColor = WHITECOLOR;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) animationStart
{
    _animationView = [GlobalConfig createViewWithFrame:CGRectMake(0,0, SCREENWIDTH, SCREENHEIGHT)];
    [self.window addSubview:_animationView];
    _animationView.backgroundColor = [UIColor whiteColor];
    //logo
     _animationImage = [GlobalConfig createImageViewWithFrame:CGRectMake((SCREENWIDTH - animationImageHeight)/2, (SCREENHEIGHT - NAVHEIGHT - animationImageHeight - animationLabelHeight - animationDistance)/2, animationImageHeight, animationImageHeight) ImageName:@"animation_image"];
    [_animationView addSubview:_animationImage];
    
    //旋转动画
    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    CGFloat number = [GlobalConfig versionIsIOS7] ? 10.0 : 10.0;
    [spin setFromValue:[NSNumber numberWithFloat:M_PI * (0.0)]];
    [spin setToValue:[NSNumber numberWithFloat:M_PI * (number)]];
    [spin setDuration:animationImageDuration];
    [spin setDelegate:self];//设置代理，可以相应animationDidStop:finished:函数，用以弹出提醒框
    //速度控制器
    [spin setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];  
    //添加动画
    [[_animationImage layer] addAnimation:spin forKey:nil];
}

//旋转结束调用
- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //logo下文字图片
    _animationLabel = [GlobalConfig createImageViewWithFrame:CGRectMake(POINT_X, _animationImage.frame.origin.y + animationDistance + animationImageHeight, SCREENWIDTH, animationLabelHeight) ImageName:@"animation_label"];
    _animationLabel.alpha = 0;
       [_animationView addSubview:_animationLabel];
    
    //文字动画
    [UIView animateWithDuration:animationLabelDuration animations:^{
        _animationLabel.alpha = 1;
    } completion:^(BOOL finish){

        //
        [UIView animateWithDuration:1.0f animations:^{_animationImage.frame = CGRectMake((SCREENWIDTH - animationImageHeight)/2, 20, animationImageHeight, animationImageHeight);}];
        
        [UIView animateWithDuration:1.0f animations:^{_animationLabel.alpha = 0;} completion:^(BOOL finish){
            
            [self performSelector:@selector(animationFinished)];
            [_animationView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:DURATION];

        }];

    }];

}

- (void) animationFinished
{
    self.client = [HTTPClient shareHTTPClient];
    
    self.window.rootViewController = [BaseNavigationController shareBaseNavigationController:[ControllerFactory  rootViewController]];

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
