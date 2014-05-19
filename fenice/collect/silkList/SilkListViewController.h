//
//  SilkListViewController.h
//  fenice
//
//  Created by 魔时网 on 13-12-6.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseHorizontalViewController.h"
#import "SilkView.h"

typedef enum {
    silkInfoViewPanDiretionLeft,
    SilkInfoViewPanDiretionRight,
} silkInfoViewPanDiretion;

@interface SilkListViewController : BaseHorizontalViewController<SilkViewDelegate>
{
    UIButton *_backButton;
    UIButton *_nextButton;
}

@property (nonatomic, strong) NSString   *categroyID;

@property (weak, nonatomic) IBOutlet UIView *infoView;//丝巾信息view
@property (weak, nonatomic) IBOutlet UIView *infoLabelView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;//编号
@property (weak, nonatomic) IBOutlet UILabel *textureLabel;//材质
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;//尺寸
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;//价格

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
           CategroyID:(NSString *)cid;
@end
