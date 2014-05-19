//
//  BaseNavigationController.h
//  modelTest
//
//  Created by 魔时网 on 13-10-31.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationView.h"

@protocol BaseNavgationControllerDelegate;

@interface BaseNavigationController : UINavigationController<NavigationViewDelegate>
{
    NavigationView         *_navView;
    NSArray                *_navTitleArray;
}

@property (nonatomic, assign) id<BaseNavgationControllerDelegate> baseNavDelegate;

+ (BaseNavigationController *) shareBaseNavigationController:(UIViewController *)root;

- (void) showBackButton:(BOOL)show;

//-(void) setNavigationViewHidden:(BOOL)hidden;

-(void) setNavigationViewHidden:(BOOL)hidden animation:(BOOL)animation;

@end

@protocol BaseNavgationControllerDelegate <NSObject>

- (void) changeControllerWithIndex:(NSInteger)index;

@end
