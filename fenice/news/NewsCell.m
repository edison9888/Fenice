//
//  NewsCell.m
//  fenice
//
//  Created by  evafan2003 on 13-12-6.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+AFNetworking.h"
#import "GlobalConfig.h"

@implementation NewsCell

-(void) initCells:(NSDictionary *)news {
    
    if ([news isKindOfClass:[NSDictionary class]]) {
        
        self.title.text = news[@"title"];
        self.detail.text = [GlobalConfig convertDate:news[@"addtime"]];
        [self.image setImageWithURL:[NSURL URLWithString:news[@"picture"]] placeholderImage:[UIImage imageNamed:@"news_list_default"]];
    }

}
@end


@implementation NewsDetailCell

-(void) initCells:(News *)news {
    
    if ([news isKindOfClass:[News class]]) {
        
        self.title.text = news.title;
        self.detail.text = news.addtime;
    }
}

@end

@implementation NewsContentCell
@end


@implementation NewsImageCell
@end