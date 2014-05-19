//
//  BaseNavigationController.m
//  modelTest
//
//  Created by 魔时网 on 13-10-31.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseNavigationController.h"
#import "GlobalConfig.h"
#import "ControllerFactory.h"
#import "HTTPClient+NavTitle.h"

static CGFloat navHeight = 65;
static CGFloat navViewAnimationDuration = 0.5f;
static CGFloat navViewAnimation_apper = 20;
static CGFloat navViewAnimation_disapper = - 85;

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        self.baseNavDelegate = (id<BaseNavgationControllerDelegate>) rootViewController;
    }
    return self;
}
  
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.hidden = YES;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
    self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:NAVIMAGE] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTintColor:WHITECOLOR];
    
     [self createNavigationBar];
    
    [[HTTPClient shareHTTPClient] getNavTitleWithSuccess:^(NSArray *array){
    
        _navTitleArray = array;
        [self changeTitleText];
    }];
    
//    //标题字体变成白色
//    if ([GlobalConfig versionIsIOS7]) {
//        [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark createView

- (void) createNavigationBar
{
    _navView = [[NavigationView alloc] initWithFrame:CGRectMake(0, 20, SCREENWIDTH, navHeight)];
    _navView.delegate =  self;
    [self.view addSubview:_navView];
}

#pragma  mark self.action

+ (BaseNavigationController *) shareBaseNavigationController:(UIViewController *)root
{
    static BaseNavigationController *_instace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [[BaseNavigationController alloc] initWithRootViewController:root];
    });
    return _instace;
}


//-(void) setNavigationViewHidden:(BOOL)hidden
//{
//    _navView.hidden = hidden;
//}

-(void) setNavigationViewHidden:(BOOL)hidden animation:(BOOL)animation
{
        CGFloat end = navViewAnimation_disapper;
        if (!hidden) {
            end = navViewAnimation_apper;
        }
    
    CGRect rect = _navView.frame;
    rect.origin.y = end;
    
    if (animation) {
        [UIView animateWithDuration:navViewAnimationDuration animations:^{
            
            _navView.frame = rect;
            
        } completion:^(BOOL finish){
            
        }];
    }
    else {
        _navView.frame = rect;
    }
}

- (void) changeTitleText
{
    [_navView setLabelText:_navTitleArray];
}

#pragma mark NavigationViewDelegate
- (void) labelClickWithIndex:(NSInteger)index
{
    [self.baseNavDelegate changeControllerWithIndex:index];
}

- (NSString *) labelText:(NSInteger)index
{
    return _navTitleArray[index];
}

- (void) backButtonClick
{
    //当前可见的controller调用navBackClick方法
    if ([self.visibleViewController  respondsToSelector:@selector(navBackClick)]) {
            [self.visibleViewController performSelector:@selector(navBackClick) withObject:nil];
    }
}

- (void) showBackButton:(BOOL)show
{
    [_navView showNavBackButton:show];
}

- (void) logoButtonClick
{
//    [self popToRootViewControllerAnimated:YES];
    if (self.childViewControllers.count > 1) {
        [GlobalConfig push:NO
            viewController:nil
    withNavigationCotroller:self
             animationType:ANIMATION_POP_TYPE
                   subType:ANIMATION_POP_SUBTYPE
                  Duration:DURATION
                  isToRoot:YES];
    }
}

@end
