//
//  StoreDetailViewController.h
//  fenice
//
//  Created by  evafan2003 on 13-12-15.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import "Store.h"
@interface StoreDetailViewController :BaseViewController<UIActionSheetDelegate>


@property (nonatomic, strong) NSString *storeId;
@property (nonatomic, strong) Store *store;
@property (weak, nonatomic) IBOutlet UILabel *storeTitle;
@property (weak, nonatomic) IBOutlet UILabel *address;

- (IBAction)call:(id)sender;
- (IBAction)showMap:(id)sender;
- (IBAction)businessTime:(id)sender;

- (id) initWithCity:(NSString *)sid;

@end
