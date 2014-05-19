//
//  RootViewController.m
//  fenice
//
//  Created by 魔时网 on 13-11-29.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "CollectViewController.h"
#import "ControllerFactory.h"
#import "FontManager.h"
#import "HTTPClient+Collect.h"

static CGFloat baseScrollViewHeight = 568;
static CGFloat catalogFontSize = 15;
static CGFloat titleFOntSize = 20;
static CGFloat catalogButtonTagExtend = 200;
static CGFloat textureButtonTagExtend = 100;

static CGFloat AD_oglFlip = 1.0;
static CGFloat AD_titleMove = 1.0;
static CGFloat AD_textureMove = 1.0;
static CGFloat AD_catagoryMove = 1.0;

static NSString *firstCatalog = @"Classico";
static NSString *secondCatalog = @"Artistico";
static NSString *thirdCatalog = @"Romantico";
static NSString *fourCatalog = @"Retro";


@interface CollectViewController ()

@end

@implementation CollectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _rect1 = _classicoView.frame;
    _rect2 = _artisticoView.frame;
    _rect3 = _romanticoView.frame;
    _rect4 = _retroView.frame;
    
    _isAnimationFinish = YES;
    
    [self initView];
    
    [self downloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) downloadData
{
    [self showLoadingView];
    [[HTTPClient shareHTTPClient] getCollectInfoWithAlertView:self.view Success:^(NSArray *seriesArray, NSArray *textureArray, NSString *title) {
        [self hideLoadingView];
        if ([GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:title]) {
            self.titleLabel.text = title;
        }
        _seriesArray = seriesArray;
        _textureArray = textureArray;
    }];
}

- (void) initView
{
    self.baseScrollView.frame = CGRectMake(POINT_X, POINT_Y, SCREENWIDTH, SCREENHEIGHT - STATEHEIGHT);
    self.baseScrollView.contentSize = CGSizeMake(SCREENWIDTH, baseScrollViewHeight);
    
    self.classicoView.backgroundColor = IMAGECOLOR(@"catalog_01");
    self.artisticoView.backgroundColor = IMAGECOLOR(@"catalog_02");
    self.romanticoView.backgroundColor = IMAGECOLOR(@"catalog_03");
    self.retroView.backgroundColor = IMAGECOLOR(@"catalog_04");
    
    self.titleLabel.zFont = [[FontManager sharedManager] zFontWithName:REQUIREFONTNAME pointSize:titleFOntSize];
}


- (IBAction)catalogClick:(UIButton *)sender {
    
    //通过判断动画是否结束 防止重复点击
    if (!_isAnimationFinish) {
        return;
    }
    _isAnimationFinish = NO;
    
    NSInteger index = (sender.tag - catalogButtonTagExtend);
    //动画view
    NSArray *viewArray = @[_classicoView,_artisticoView,_romanticoView,_retroView];
    if (index >=0 && index < viewArray.count) {
        
        UIView *view = viewArray[index];
        NSString *text = [self catalogText:index];
        [self catagoryOlgFlip:index view:view text:text];
    }
}

//翻转动画
- (void) catagoryOlgFlip:(NSInteger)index view:(UIView *)view text:(NSString *)text
{
    //添加label
    FontLabel *catalogLabel = [[FontLabel alloc] initWithFrame:CGRectMake(-20, -10, view.frame.size.width + 40, view.frame.size.height + 20) fontName:REQUIREFONTNAME pointSize:catalogFontSize];
    catalogLabel.textAlignment = NSTextAlignmentCenter;
    catalogLabel.textColor = REDCOLOR;
    catalogLabel.backgroundColor = WHITECOLOR;
    catalogLabel.text = text;
    
    //动画
    [UIView transitionWithView:view duration:AD_oglFlip options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [view addSubview:catalogLabel];
    } completion:^(BOOL finished){
        
        //navigationView移动
        [[BaseNavigationController shareBaseNavigationController:nil] setNavigationViewHidden:YES animation:YES];
        //标题移动
        [self animationWithTitleLabelDisapper:YES completion:^{
            //方块移动
            NSArray *viewArray = @[_classicoView,_artisticoView,_romanticoView,_retroView];
            [self animationWithCatagroyView:viewArray index:index dutation:AD_catagoryMove completion:^{
            }];


        }];
        
        //材质icon移动
        NSArray *textureArray = @[_first_textureVIew,_second_textureView,_third_TextureView];
        [self animationWithTextureView:textureArray disapper:YES completion:^{
            
        }];
    }];
}

//标题移动
- (void) animationWithTitleLabelDisapper:(BOOL)disapper completion:(void (^)(void))completion
{
   static CGFloat titleHeight;
    if (disapper) {
        titleHeight = self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height;
    }
    [self animationWithView:self.titleLabel moveTo:CGRectOffset(self.titleLabel.frame, 0,(disapper ? - titleHeight : titleHeight) ) duration:AD_titleMove completion:completion];
}

//材质移动
- (void) animationWithTextureView:(NSArray *)textureArray disapper:(BOOL)disapper completion:(void (^)(void))completion
{
    
    for (UIView *view in textureArray) {
        
        static CGFloat textureHeight;
        if (disapper) {
            textureHeight = self.baseScrollView.contentSize.height - view.frame.origin.y;
        }
    
        [self animationWithView:view moveTo:CGRectOffset(view.frame, 0, (disapper ? textureHeight : - textureHeight)) duration:AD_textureMove completion:completion];
    }
}

//方块移动
- (void) animationWithCatagroyView:(NSArray *)catagroyView
                             index:(NSInteger)index
                          dutation:(CGFloat)duration
                        completion:(void(^)(void))completion
{
    CGFloat dx = _classicoView.frame.size.width;
    CGFloat dy = _classicoView.frame.size.height;

           switch (index) {
               case 1:
                   dx = - dx;
                   break;
               case 2:
                   dy = - dy;
                   break;
               case 3:
                   dx = - dx;
                   dy = - dy;
                   break;
               default:
                   break;
           }
    
    //其他3个行动
    [UIView animateWithDuration:duration * 2 animations:^{
        for (UIView *view in catagroyView) {
            if ([catagroyView indexOfObject:view] != index) {
                view.frame = CGRectOffset(view.frame, 4 *dx, 4*dy);
            }
        }
    } completion:^(BOOL finish){
        [self animationFinished:index];
    }];
    
    //自己单独行动
    [UIView animateWithDuration:duration animations:^{
        UIView *view = catagroyView[index];
        view.frame = CGRectOffset(view.frame, dx, dy);
    } completion:^(BOOL finished){
    
    }];
    
}

- (void) animationWithView:(UIView *)view moveTo:(CGRect)rect duration:(CGFloat)duration completion:(void (^)(void))completion
{
    [UIView animateWithDuration:duration animations:^{
        view.frame = rect;
    } completion:^(BOOL finish){
        completion();
    }];
}

//类型文字
- (NSString *) catalogText:(NSInteger)index
{
    if (index < 4 && index >= 0) {
        NSArray *array = @[firstCatalog,secondCatalog,thirdCatalog,fourCatalog];
        return array[index];
    }
    return @"";
}

- (IBAction) texttureClick:(UIButton *)sender {
   
    if (!_isAnimationFinish) {
        return;
    }
    
    NSInteger index = (NSInteger)(sender.tag - textureButtonTagExtend);
    silkTextureModel *model = [[silkTextureModel alloc] init];
    if (index >= 0 && index < _textureArray.count) {
        model = _textureArray[index];
       
    }
     [GlobalConfig push:YES
         viewController:[ControllerFactory textureViewControllerWithTextureModel:model]
withNavigationCotroller:self.navigationController
          animationType:ANIMATION_PUSH_TYPE
                subType:ANIMATION_PUSH_SUBTYPE
               Duration:DURATION
               isToRoot:NO];
}

- (void) animationFinished:(NSInteger)index
{
    SilkSeriesModel *model = [[SilkSeriesModel alloc] init];
    if (index >= 0 && index < _seriesArray.count) {
        model = _seriesArray[index];
        
    }
    [GlobalConfig push:YES
        viewController:[ControllerFactory silkListViewControllerWithCategroyID:model.sid]
withNavigationCotroller:self.navigationController
         animationType:ANIMATION_PUSH_TYPE
               subType:ANIMATION_PUSH_SUBTYPE
              Duration:DURATION
              isToRoot:NO];
    
    [self performSelector:@selector(allViewScrollToInitial) withObject:nil afterDelay:DURATION];
}

//回归初始化
- (void) allViewScrollToInitial
{
    _isAnimationFinish = YES;
    
    [self animationWithTitleLabelDisapper:NO completion:^{
    
    }];
    [self animationWithTextureView:@[_first_textureVIew,_second_textureView,_third_TextureView] disapper:NO completion:^{
    
    }];
    
    _classicoView.frame = _rect1;
    _artisticoView.frame = _rect2;
    _romanticoView.frame = _rect3;
    _retroView.frame = _rect4;
    
    NSArray *array = @[_classicoView,_artisticoView,_romanticoView,_retroView];
    for (UIView *view in array) {
        [view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    

}

@end
