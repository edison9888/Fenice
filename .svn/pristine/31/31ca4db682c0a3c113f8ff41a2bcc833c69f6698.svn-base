//
//  StoreAddressViewController.m
//  fenice
//
//  Created by  evafan2003 on 13-12-18.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "StoreAddressViewController.h"
#import "StoreCell.h"

@interface StoreAddressViewController ()

@end

@implementation StoreAddressViewController

- (id)initWithStore:(Store *)store NibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.store = store;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    StoreListTitle *titleView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([StoreCell class]) owner:self options:nil] lastObject];
    [titleView initTitle:[NSString stringWithFormat:@"%@->%@",self.store.city,self.store.title]];
    titleView.frame = CGRectMake(0, 85, SCREENWIDTH, 73);
    [self.view addSubview:titleView];
    
    self.time.text = self.store.time;
    self.time.textColor = REDCOLOR;
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
@end
