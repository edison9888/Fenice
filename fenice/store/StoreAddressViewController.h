//
//  StoreAddressViewController.h
//  fenice
//
//  Created by  evafan2003 on 13-12-18.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import "Store.h"

@interface StoreAddressViewController : BaseViewController<UIActionSheetDelegate>

@property Store * store;
@property (weak, nonatomic) IBOutlet UITextView *time;

- (IBAction)call:(id)sender;
- (IBAction)showMap:(id)sender;
- (id)initWithStore:(Store *)store NibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
@end
