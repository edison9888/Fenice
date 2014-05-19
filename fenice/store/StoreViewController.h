//
//  StoreViewController.h
//  fenice
//
//  Created by 魔时网 on 13-12-2.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import "MoshGetLocation.h"

@interface StoreViewController : BaseViewController<MoshLocationInfoDelegate>

@property (nonatomic, strong) MoshGetLocation *locationInfo;
@property (nonatomic, strong) NSMutableArray *storeArr;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)nearby:(id)sender;
- (IBAction)query:(id)sender;

@end
