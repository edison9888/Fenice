//
//  TextureViewController.m
//  fenice
//
//  Created by 魔时网 on 13-12-12.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "TextureViewController.h"

static CGFloat  currentNavHeight = 85;

@interface TextureViewController ()

@end

@implementation TextureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil silkTextureModel:(silkTextureModel *)texture
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.silkTexture = texture;
    }
    return self;
}

- (id) initWithSilkTextureModel:(silkTextureModel *)texture
{
    if (self = [super init]) {
         self.silkTexture = texture;
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [[BaseNavigationController shareBaseNavigationController:nil] showBackButton:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createView];
    _oldPointY = POINT_Y;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.silkTexture.contentUrl] cachePolicy: NSURLRequestReturnCacheDataElseLoad timeoutInterval:10.0f];
    
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    
      __unsafe_unretained typeof(self) weakSelf = self;
    [self showLoadingView];
    [self.imageView setImageWithURLRequest:request
                          placeholderImage:nil
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image){
                                       
                                       
                                       [weakSelf successWithImage:image];
                                   }
                                   failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error){
                                       [weakSelf failure];
    
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createView
{
    self.baseScrollView = [[UIScrollView alloc] init];
    self.baseScrollView.delegate = self;
    [self.view addSubview:self.baseScrollView];
    
    self.imageView = [[UIImageView alloc] init];
    [self.baseScrollView addSubview:self.imageView];
    
    
}

//成功
- (void) successWithImage:(UIImage *)image
{
    [self hideLoadingView];
    CGSize size = image.size;
    
    if (size.width > 320) {
        CGFloat scale = size.width/320;
        size.width = 320;
        size.height = size.height / scale;
    }

    self.imageView.frame = CGRectMake(0, currentNavHeight, size.width, size.height);
    self.imageView.image = image;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.baseScrollView.frame = CGRectMake(POINT_X, POINT_Y, SCREENWIDTH, SCREENHEIGHT);
    self.baseScrollView.contentSize = CGSizeMake(SCREENWIDTH, size.height + currentNavHeight);
}

//失败
- (void) failure
{
    [self hideLoadingView];
    [GlobalConfig showAlertViewWithMessage:ERROR_LOADINGFAIL superView:self.view];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.baseScrollView.contentOffset.y  <= POINT_Y) {
       return;
    }
    
    if (self.baseScrollView.contentOffset.y >= (self.baseScrollView.contentSize.height - self.baseScrollView.frame.size.height)) {
        return;
    }

    if (self.baseScrollView.contentOffset.y > _oldPointY) {
        [[BaseNavigationController shareBaseNavigationController:nil] setNavigationViewHidden:YES animation:YES];
    }
    else {
        [[BaseNavigationController shareBaseNavigationController:nil] setNavigationViewHidden:NO animation:YES];
    }
    _oldPointY = self.baseScrollView.contentOffset.y;
    
}



@end
