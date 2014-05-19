//
//  SilkView.m
//  fenice
//
//  Created by 魔时网 on 13-12-6.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "SilkView.h"
#import "SilkModel.h"
#import "UIImageView+AFNetworking.h"
#import "GlobalConfig.h"

static CGFloat baseScrollViewHeight = 548;

//static CGFloat alpha_translucent = 0.0f;


@implementation SilkView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isTouch = NO;
    }
    return self;
}

- (void) drawRect:(CGRect)rect
{
    _isTouch = NO;
}

- (void) initWithDataArray:(NSArray *)array
{
    self.silkArray = array;
    self.baseScrollView.frame = CGRectMake(POINT_X, POINT_Y, SCREENWIDTH, SCREENHEIGHT - STATEHEIGHT);
    self.baseScrollView.contentSize = CGSizeMake(SCREENWIDTH, baseScrollViewHeight);

    //3.5屏滑动到底部 4屏滑到顶部
    [self refreshScrollViewContentOffSet];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.baseScrollView addGestureRecognizer:tap];
    
    //创建pageControl
    [self createPageControl];
    
    //创建风火轮
    [self createActivityIndicatorView];
}

- (void) tap:(UITapGestureRecognizer *)ges
{
    if (_isTouch) {//转成没有被点击状态
        _isTouch = NO;
    }
    else {//转成被点击状态
        _isTouch = YES;
    }
    [self silkViewTouchChange:_isTouch];
    [self.delegate silkViewIsTouch:_isTouch];
}

- (void) silkViewTouchChange:(BOOL)isTouch
{
    if (isTouch) {
        [self silkViewTouch];
    }
    else {
        [self silkViewNotTouch];
    }
    
}

- (void) createPageControl
{
    _pageControl = [[MoshPageControl alloc] initWithSilkArray:self.silkArray];
    _pageControl.delegate = self;
    [_pageControl singlePageIsHidden:YES];
    CGSize size = [MoshPageControl sizeOfPageControl:self.silkArray];
    size.height = 40;
    _pageControl.frame = CGRectMake((SCREENWIDTH - size.width)/2, (self.pageControlView.frame.size.height - size.height)/2, size.width, size.height);
    [self.pageControlView addSubview:_pageControl];
    
    [self silkViewNotTouch];
    [self showSilkWithColorIndex:0 animation:NO];
}

- (void) createActivityIndicatorView
{
    _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicator.frame = self.frame;
    [_indicator hidesWhenStopped];
    [_indicator startAnimating];
    [self insertSubview:_indicator atIndex:0];
}

/*
 重新设置数据 （已存在 赋值时使用）
 */
- (void) reloadDataWithSilkArray:(NSArray *)array
{
    self.silkArray = array;
    
    //重置pageControll
    [self refreshView];
    
    [self refreshScrollViewContentOffSet];
    
    //显示原始状态 显示第一个颜色的信息
    [self silkViewNotTouch];
    [self showSilkWithColorIndex:0 animation:NO];
    
}

//初始化baseScrollView的位置 3.5屏滑动到底部 4屏滑到顶部
- (void) refreshScrollViewContentOffSet
{
    if (SCREENHEIGHT == 480) {
        self.baseScrollView.contentOffset = CGPointMake(0, baseScrollViewHeight - SCREENHEIGHT + ([GlobalConfig versionIsIOS7]?0:20));
        self.baseScrollView.scrollEnabled = NO;
    }
    else {
       [self.baseScrollView setContentOffset:CGPointMake(0, 0) animated:NO];  
    }
}

//清空view
- (void) refreshView
{
    //重新设置pageControl
    [_pageControl setNeedsDisplayWithSilkArray:self.silkArray];
    [_pageControl singlePageIsHidden:YES];
    CGSize size = [MoshPageControl sizeOfPageControl:self.silkArray];
    size.height = 40;
    _pageControl.frame = CGRectMake((SCREENWIDTH - size.width)/2, (self.pageControlView.frame.size.height - size.height)/2, size.width, size.height);
    
    self.silkImage.image = nil;
}

//更新丝巾图片
- (void) showSilkWithColorIndex:(NSInteger)index animation:(BOOL)animation
{
    if (index < self.silkArray.count && index >= 0) {
        SilkModel *silk = self.silkArray[index];
        
        if (animation) {
            [UIView animateWithDuration:1.0f animations:^{
                self.silkImage.alpha = 0;
            } completion:^(BOOL finish){
                [UIView animateWithDuration:1.0f animations:^{
                    self.silkImage.image = nil;
                    [self.silkImage setImageWithURL:[NSURL URLWithString:silk.imageUrl]];
                    self.silkImage.alpha = 1;
                } completion:^(BOOL finish) {
                
                }];
            }];
        }
        else {
            self.silkImage.image = nil;
            [self.silkImage setImageWithURL:[NSURL URLWithString:silk.imageUrl]];
        }
    }
}

/*
 没有被点击
 白色遮罩alpha=0，
 显示pageControl,
 隐藏丝巾信息
 */
- (void) silkViewNotTouch
{
//    self.translucentView.backgroundColor = CLEARCOLOR;
//    self.pageControlView.hidden = NO;
//    self.infoView.hidden = YES;
}

/*
 点击后
 白色遮罩alpha！=0，
 隐藏pageControl,
 显示丝巾信息
 */
- (void) silkViewTouch
{
//    self.translucentView.backgroundColor = [UIColor colorWithWhite:1 alpha:alpha_translucent];
//    self.pageControlView.hidden = YES;
//    self.infoView.hidden = NO;
}

#pragma mark MoshPageControlDelegate
//pageControl被点击
- (void) pageControlSelectedWithIndex:(NSInteger)index
{
    //更新图片
    [self showSilkWithColorIndex:index animation:YES];
    
    if (index < self.silkArray.count && index >= 0) {
        SilkModel *silk = self.silkArray[index];
        
        //更新信息
        [self.delegate silkVIewInfoChange:silk];
    }
}
@end
