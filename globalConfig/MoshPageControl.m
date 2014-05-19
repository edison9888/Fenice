//
//  MoshPageControl.m
//  fenice
//
//  Created by 魔时网 on 13-12-6.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "MoshPageControl.h"
#import "GlobalConfig.h"
#import "UIImageView+AFNetworking.h"
static CGFloat buttonWidth = 28;
static CGFloat buttonHeight = 28;
static CGFloat buttonDistance = 15;
static NSInteger buttonTagExtend = 300;

@implementation MoshPageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) initWithSilkArray:(NSArray *)array
{
    if (self = [super init]) {
        self.backgroundColor = CLEARCOLOR;
        self.silkArray = array;
        [self createView];
    }
    return self;
}

- (void) createView
{
    _translationArray = [NSMutableArray array];

    for (int i = 0;i < self.silkArray.count;i++) {
        SilkModel *silk = self.silkArray[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((buttonWidth + buttonDistance) *i, (self.frame.size.height - buttonHeight)/2, buttonWidth, buttonHeight)];
        imageView.backgroundColor = CLEARCOLOR;
        [imageView setImageWithURL:[NSURL URLWithString:silk.pageImage] placeholderImage:[UIImage imageNamed:@"page"]];
//        [imageView setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"page"]];
        [self addSubview:imageView];
        
        UIImageView *tran = [GlobalConfig createImageViewWithFrame:imageView.frame ImageName:nil];
        tran.backgroundColor = CLEARCOLOR;
        [self addSubview:tran];
        [_translationArray addObject:tran];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = CLEARCOLOR;
        button.frame = CGRectMake(imageView.frame.origin.x - buttonDistance/2, 0, buttonWidth + buttonDistance, self.frame.size.height);
        button.tag = buttonTagExtend + i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    [self changeSelectImage:0];
}

+ (CGSize) sizeOfPageControl:(NSArray *)array
{
    return CGSizeMake(buttonWidth * array.count + buttonDistance * (array.count - 1), buttonHeight);
}

- (void) buttonClick:(UIButton *)sender
{
    NSInteger index = sender.tag - buttonTagExtend;
 
    //改变选中状态
    [self changeSelectImage:index];
    //通知代理
    [self.delegate pageControlSelectedWithIndex:index];
}

//改变选中图片的状态
- (void) changeSelectImage:(NSInteger)index
{
    if (index < _translationArray.count) {
        for (UIImageView *view in _translationArray) {
//            view.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.8f];
            view.image  = nil;
            if ([_translationArray indexOfObject:view] == index) {
//                view.backgroundColor = CLEARCOLOR;
                view.image = [UIImage imageNamed:@"pageControlTrans"];
            }
        }
    }
}

//重新进行布局
- (void) setNeedsDisplayWithSilkArray:(NSArray *)array
{
    self.silkArray = array;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self createView];
}

//一个page是否隐藏，需要调用而不是属性
- (void) singlePageIsHidden:(BOOL)isHidden
{
    if (self.silkArray.count <= 1 && isHidden) {
        self.hidden = YES;
    }
    else {
        self.hidden = NO;
    }
}



@end
