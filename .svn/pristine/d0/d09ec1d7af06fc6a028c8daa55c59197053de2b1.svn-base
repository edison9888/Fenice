//
//  StoreDetailViewController.m
//  fenice
//
//  Created by  evafan2003 on 13-12-15.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "StoreDetailViewController.h"
#import "HTTPClient+Store.h"
#import "RotateVIew.h"
#import "GlobalConfig.h"
#import "MoshDefine.h"

@interface StoreDetailViewController ()

@end

@implementation StoreDetailViewController

//拨打电话
- (IBAction)call:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"拨打电话" delegate:self cancelButtonTitle:BUTTON_CANCEL destructiveButtonTitle:nil otherButtonTitles:nil, nil];

    [actionSheet addButtonWithTitle:self.store.tel];
    [actionSheet showInView:self.view];
    
}

//查看地图
- (IBAction)showMap:(id)sender {

    [[BaseNavigationController shareBaseNavigationController:nil] showBackButton:YES];
    [GlobalConfig push:YES
        viewController:[ControllerFactory mapViewController:self.store]
withNavigationCotroller:self.navigationController
         animationType:ANIMATION_PUSH_TYPE
               subType:ANIMATION_PUSH_SUBTYPE
              Duration:DURATION
              isToRoot:NO];
}

//营业时间
- (IBAction)businessTime:(id)sender {
    [[BaseNavigationController shareBaseNavigationController:nil] showBackButton:YES];
    [GlobalConfig push:YES
        viewController:[ControllerFactory storeAddressViewController:self.store]
withNavigationCotroller:self.navigationController
         animationType:ANIMATION_PUSH_TYPE
               subType:ANIMATION_PUSH_SUBTYPE
              Duration:DURATION
              isToRoot:NO];
    
}


- (id) initWithCity:(NSString *)sid{

    self = [super initWithNibName:NSStringFromClass([StoreDetailViewController class]) bundle:nil];
//    self = [super init];
    if (self) {
        
        self.storeId = sid;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self downloadData];
}

- (void) downloadData {
    
    [[HTTPClient shareHTTPClient] getStoreDetailWithId:self.storeId view:self.view sucess:^(NSDictionary *store){
        self.store = [Store store:store];
        [self setData];
    }];
    
}


-(void) setData {
    
    self.storeTitle.text = self.store.title;
    self.address.text = self.store.address;
    
    RotateView *rotateView = [[RotateView alloc] initWithFrame:CGRectMake(0, 85, SCREENWIDTH, SCREENHEIGHT==568?344:222) andImageFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT==568?344:222) andDataArray:self.store.imgUrl defaultImage:@"store_default" pageControl:NO];
    [rotateView startAutoRotate];
    [self.view addSubview:rotateView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark--
#pragma UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        return;
    }
    [GlobalConfig makeCall:self.store.tel];
}


@end
