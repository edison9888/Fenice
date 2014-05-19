//
//  SilkView.h
//  fenice
//
//  Created by 魔时网 on 13-12-6.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoshPageControl.h"

@protocol SilkViewDelegate;

@interface SilkView : UIView<MoshPageControlDelegate>
{
    BOOL _isTouch;//是否被点击
    UIActivityIndicatorView *_indicator;
    MoshPageControl *_pageControl;
    
}
@property (nonatomic, strong) NSArray *silkArray;//不同颜色丝巾Array
@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;

@property (weak, nonatomic) IBOutlet UIImageView *silkImage;//丝巾照片
@property (weak, nonatomic) IBOutlet UIView *pageControlView;//色卡view
@property (weak, nonatomic) IBOutlet UIView *translucentView;//遮罩view
@property (nonatomic ,assign) id<SilkViewDelegate> delegate;

- (void) initWithDataArray:(NSArray *)array;

/*
 更新silk信息（点击颜色调用）
 */
- (void) showSilkWithColorIndex:(NSInteger)index animation:(BOOL)animation;

/*
 重新设置数据 （已存在 赋值时使用）
 */
- (void) reloadDataWithSilkArray:(NSArray *)array;

@end


@protocol SilkViewDelegate <NSObject>

/*
 被点击调用 
 yes代表被点击状态 no代表初始状态
 */
- (void) silkViewIsTouch:(BOOL)isTouch;

- (void) silkVIewInfoChange:(SilkModel *)silk;

@end
