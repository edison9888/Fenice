//
//  NewsDetailViewController.h
//  fenice
//
//  Created by  evafan2003 on 13-12-9.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseTableViewController.h"
#import "News.h"

@interface NewsDetailViewController : BaseTableViewController


@property (nonatomic, strong) NSString *nid;
@property (nonatomic, assign) int hasImage;
@property (nonatomic, strong) News *news;
@property (nonatomic, strong) NSMutableArray *currentImage;
- (id) initWithNid:(NSString *)nid;
@end
