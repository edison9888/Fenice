//
//  NavigationView.h
//  fenice
//
//  Created by 魔时网 on 13-12-2.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavigationViewDelegate;

@interface NavigationView : UIView
{
    NSMutableArray *_navLabelArray;
    UIView         *_backView;
}

@property (nonatomic, assign) id<NavigationViewDelegate> delegate;

- (void) showNavBackButton:(BOOL)show;

- (void) setLabelText:(NSArray *)array;

@end


@protocol  NavigationViewDelegate <NSObject>

//文字内容
- (NSString *) labelText:(NSInteger)index;

//点击文字调用
- (void) labelClickWithIndex:(NSInteger)index;

//返回Click
- (void) backButtonClick;

//logoClick、
- (void) logoButtonClick;

@end