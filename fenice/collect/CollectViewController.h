//
//  RootViewController.h
//  fenice
//
//  Created by 魔时网 on 13-11-29.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import "FontLabel.h"

@interface CollectViewController : BaseViewController
{
   BOOL _isAnimationFinish;//动画结束
    NSArray *_seriesArray;//丝巾系列
    NSArray *_textureArray;//丝巾材质
    
    CGRect _rect1;
    CGRect _rect2;
    CGRect _rect3;
    CGRect _rect4;
}
@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;

@property (weak, nonatomic) IBOutlet UIView *classicoView;
@property (weak, nonatomic) IBOutlet UIView *artisticoView;
@property (weak, nonatomic) IBOutlet UIView *romanticoView;
@property (weak, nonatomic) IBOutlet UIView *retroView;

@property (weak, nonatomic) IBOutlet UIImageView *first_textureVIew;
@property (weak, nonatomic) IBOutlet UIImageView *second_textureView;
@property (weak, nonatomic) IBOutlet UIImageView *third_TextureView;
@property (weak, nonatomic) IBOutlet FontLabel *titleLabel;

- (IBAction)catalogClick:(UIButton *)sender;

- (IBAction) texttureClick:(UIButton *)sender;
@end
