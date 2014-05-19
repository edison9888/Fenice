//
//  BaseHorizontalViewController.m
//  fenice
//
//  Created by 魔时网 on 13-12-6.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseHorizontalViewController.h"

@interface BaseHorizontalViewController ()

@end

@implementation BaseHorizontalViewController

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
    //初始化
    self.columnWidth = SCREENWIDTH;
    self.page = 1;
    self.hasMore = YES;//如果有分页 将hasmore设为yes
	
    //tableView
    [self createTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//私有方法 不需要写在.h文件中
#pragma privateAction
- (void) createTableView
{
    self.baseTableView = [[HorizontalTableView alloc] initWithFrame:[self returnBaseTableViewFrame]];
    
    self.baseTableView.delegate = self;
    self.baseTableView.backgroundColor = CLEARCOLOR;
    [self.view addSubview:self.baseTableView];
}


//受保护方法 继承类可用
#pragma protectAction

//改变tableview的frame
- (CGRect) returnBaseTableViewFrame
{
    return CGRectMake(POINT_X, POINT_Y, SCREENWIDTH, SCREENHEIGHT - STATEHEIGHT - NAVHEIGHT);
}

- (void) reloadWithData:(NSArray *)array
{
    [self hideLoadingView];
    self.dataArray = (NSMutableArray *)array;
    [self.baseTableView refreshData];
}

//列表加载完成
-(void)listFinishWithDataArray:(NSArray *)tmpArr {
    
    if (tmpArr != nil) {
        if (tmpArr.count == 0 && self.page == 1) {
            [self reloadWithData:tmpArr];
            [GlobalConfig showAlertViewWithMessage:ERROR_EMPTYDATA superView:self.view];
        }
        else {
            
            if (self.page == 1) {
                [self reloadWithData:tmpArr];
            }else {
                [self.dataArray addObjectsFromArray:tmpArr];
                [self.baseTableView refreshData];
            }
            if (tmpArr.count < 10) {
                self.hasMore = NO;
            } else {
                self.page++;
            }
            //            if (self.request.isSuccess == NO) {
            //                [GlobalConfig showAlertViewWithMessage:ERROR_LOADINGFAIL superView:self.view];
            //            }
        }
    }else{
        self.hasMore = NO;
    }
    [self hideLoadingView];
}

- (void) downloadData
{
    
}

//加载更多
//color为nil代表不需要显示“加载更多“内容
- (void) downloadMore:(NSInteger)index
{
    if ((index == self.dataArray.count-3) && self.hasMore) {
            //加载数据
            [self downloadData];

    }
}

#pragma  tableViewDelegate
- (NSInteger)numberOfColumnsForTableView:(HorizontalTableView *)tableView;
{
    return self.dataArray.count;
}
- (UIView *)tableView:(HorizontalTableView *)tableView viewForIndex:(NSInteger)index;
{
    return [[UIView alloc] init];
}
- (CGFloat)columnWidthForTableView:(HorizontalTableView *)tableView;
{
    return self.columnWidth;
}

- (void) horizontalScrollViewDidEndDragging:(HorizontalTableView *)tableView willDecelerate:(BOOL)decelerate
{
}

- (void) horizontalScrollViewDidEndDeceletating:(HorizontalTableView *)tableView
{

}

- (void) horizontalScrollViewDidScroll:(HorizontalTableView *)tableView
{

}

@end
