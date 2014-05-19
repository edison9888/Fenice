//
//  BaseHorizontalViewController.h
//  fenice
//
//  Created by 魔时网 on 13-12-6.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import "HorizontalTableView.h"

@interface BaseHorizontalViewController : BaseViewController<HorizontalTableViewDelegate>

@property (nonatomic, strong) HorizontalTableView   *baseTableView;

//数据
@property (nonatomic, assign) int                   page;
@property (nonatomic, assign) BOOL                  hasMore;
@property (nonatomic, assign) CGFloat               columnWidth;

//改变tableview的frame
- (CGRect) returnBaseTableViewFrame;

/*
 加载完成解析
 */
-(void)listFinishWithDataArray:(NSArray *)tmpArr;

//加载更多
//color为nil代表不需要显示“加载更多“内容
- (void) downloadMore:(NSInteger)index;


@end
