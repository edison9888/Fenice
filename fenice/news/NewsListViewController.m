//
//  NewsListViewController.m
//  fenice
//
//  Created by 魔时网 on 13-12-2.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "NewsListViewController.h"
#import "ControllerFactory.h"
#import "NewsCell.h"
#import "HTTPClient+News.h"
#import "News.h"
#import "ControllerFactory.h"

@interface NewsListViewController ()

@end

@implementation NewsListViewController

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
    // Do any additional setup after loading the view from its nib.
    self.roundArr = [NSMutableArray array];
//    self.baseTableView 
    [self downloadData];
    [self addEGORefreshOnTableView:self.baseTableView];
}


- (void) buttonClick:(UIButton *)button
{
    [self.navigationController pushViewController:[ControllerFactory collectViewController] animated:YES];
    [[BaseNavigationController shareBaseNavigationController:nil] showBackButton:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) downloadData {
    
    self.baseTableView.frame = CGRectMake(0, 20, SCREENWIDTH, SCREENHEIGHT-20);
    [self showLoadingView];
    [[HTTPClient shareHTTPClient] getNewsListWithPage:self.page view:self.view sucess:^(NSMutableArray *arr,NSMutableArray *roundArr) {
        
        self.roundArr = roundArr;
        self.dataArray = arr;
        
        NSMutableArray *tmpArr = [NSMutableArray array];
        for (NSDictionary *dic in self.roundArr) {
            [tmpArr addObject:dic[@"picture"]];
        }
        
        RotateView *rotateView = [[RotateView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 287) andImageFrame:CGRectMake(0, 65, SCREENWIDTH, 222) andDataArray:tmpArr defaultImage:@"news_title_default" pageControl:YES];
        rotateView.delegate = self;
        [rotateView startAutoRotate];
        self.baseTableView.tableHeaderView = rotateView;
        
        [self listFinishWithDataArray:self.dataArray];
    }];

}

#pragma mark--
#pragma RotateViewDelegate
- (void) rotateViewPressedWith:(NSInteger)currentPage {
    
    NSDictionary *news = [self.roundArr objectAtIndex:currentPage];
    [self.navigationController pushViewController:[ControllerFactory newsDetailViewController:news[@"id"]] animated:YES];
    [[BaseNavigationController shareBaseNavigationController:nil] showBackButton:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellind = @"newsitem";

    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellind];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NewsCell class]) owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    [cell initCells:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 73;
}
- (NSInteger)numberOfSections {
    
    return 1;
}
- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *news = [self.dataArray objectAtIndex:indexPath.row];
    
    [GlobalConfig push:YES
        viewController:[ControllerFactory newsDetailViewController:news[@"id"]]
withNavigationCotroller:self.navigationController
         animationType:ANIMATION_PUSH_TYPE
               subType:ANIMATION_PUSH_SUBTYPE
              Duration:DURATION
              isToRoot:NO];
    [[BaseNavigationController shareBaseNavigationController:nil] showBackButton:YES];
    
}

@end
