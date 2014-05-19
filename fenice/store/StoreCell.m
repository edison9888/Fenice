//
//  StoreCell.m
//  fenice
//
//  Created by  evafan2003 on 13-12-16.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "StoreCell.h"

@implementation StoreCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initCells:(NSDictionary *)dic {
    
        
        self.title.text = [dic objectForKey:@"name"];
    
}
@end


@implementation StoreListTitle

-(void) initTitle:(NSString *)city {
    
    self.title.text = city;
}

@end