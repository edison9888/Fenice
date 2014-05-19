//
//  TextureViewController.h
//  fenice
//
//  Created by 魔时网 on 13-12-12.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import "CollectModel.h"

@interface TextureViewController : BaseViewController<UIScrollViewDelegate>
{
    CGFloat     _oldPointY;
}

@property (nonatomic ,strong) silkTextureModel   *silkTexture;
@property (strong, nonatomic) IBOutlet UIScrollView *baseScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil silkTextureModel:(silkTextureModel *)texture;

- (id) initWithSilkTextureModel:(silkTextureModel *)texture;

@end
