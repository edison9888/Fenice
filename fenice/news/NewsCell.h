//
//  NewsCell.h
//  fenice
//
//  Created by  evafan2003 on 13-12-6.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UIImageView *image;

- (void) initCells:(NSDictionary *)news;
@end


@interface NewsDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;

@property (strong, nonatomic) News *news;
- (void) initCells:(News *)news;
@end

@interface NewsContentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *detail;
@end

@interface NewsImageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (assign, nonatomic) BOOL isSuccess;
@end