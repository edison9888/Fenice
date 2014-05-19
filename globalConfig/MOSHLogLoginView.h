//
//  MOSHLogLoginView.h
//  fenice
//
//  Created by 魔时网 on 13-12-4.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MOSHLogLoginViewDelegate <NSObject>

- (void) closeView;

@end

@interface MOSHLogLoginView : UIView

@property (weak, nonatomic) IBOutlet UITextField *checkNumber;
@property (assign, nonatomic) id<MOSHLogLoginViewDelegate> delegate;
- (IBAction)login:(id)sender;
- (IBAction)close:(id)sender;

@end
