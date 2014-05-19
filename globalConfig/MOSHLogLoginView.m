//
//  MOSHLogLoginView.m
//  fenice
//
//  Created by 魔时网 on 13-12-4.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "MOSHLogLoginView.h"

static NSString *checkNumber = @"moshlog";

@implementation MOSHLogLoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)login:(id)sender {
    if ( [self.checkNumber.text isEqualToString:checkNumber]) {
        [self removeFromSuperview];
    }
}

- (IBAction)close:(id)sender {
    [self.delegate closeView];
}
@end
