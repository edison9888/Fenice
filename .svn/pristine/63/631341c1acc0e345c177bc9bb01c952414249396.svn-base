//
//  MoshPageControl.h
//  fenice
//
//  Created by 魔时网 on 13-12-6.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SilkModel.h"

@protocol MoshPageControlDelegate;

@interface MoshPageControl : UIView
{
    NSMutableArray *_translationArray;//遮罩
}
@property (nonatomic ,strong) NSArray *silkArray;
@property (nonatomic ,assign) id<MoshPageControlDelegate> delegate;


- (id) initWithSilkArray:(NSArray *)array;
/*
 通过传入的数组计算view的尺寸
 */
+ (CGSize) sizeOfPageControl:(NSArray *)array;

/*
 重新生成pageControl
 */
- (void) setNeedsDisplayWithSilkArray:(NSArray *)array;

/*
 单一page是否隐藏
 */
- (void) singlePageIsHidden:(BOOL)isHidden;

@end

@protocol  MoshPageControlDelegate <NSObject>

/*
 pageControl被点击
 */
- (void) pageControlSelectedWithIndex:(NSInteger)index;

@end
