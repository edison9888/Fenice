//
//  StoreListViewController.m
//  fenice
//
//  Created by  evafan2003 on 13-12-15.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "StoreListViewController.h"
#import "HTTPClient+Store.h"
#import "StoreCell.h"
#import "ControllerFactory.h"

@interface StoreListViewController ()

@end

@implementation StoreListViewController

- (id) initWithCity:(NSDictionary *)city type:(ListType)type {

    self = [super init];
    if (self) {
        
        self.currentCity = city;
        self.type = type;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    StoreListTitle *titleView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([StoreCell class]) owner:self options:nil] lastObject];
    [titleView initTitle:self.currentCity[@"name"]];
    self.baseTableView.tableHeaderView = titleView;
    
    [self downloadData];
    
}

//获取数据
- (void) downloadData {
    self.baseTableView.frame = CGRectMake(0, 20, SCREENWIDTH, SCREENHEIGHT-20);
    
    if (self.type == ListTypeCity) {
        
        [[HTTPClient shareHTTPClient] getStoreListWithView:self.view Sucess:^(NSMutableArray *cityArr,NSMutableArray *roundArr,NSMutableArray *storeArr){
            self.dataArray = cityArr;
            self.roundArr = roundArr;
            self.storeArr = storeArr;
            [self.baseTableView reloadData];
            
        }];
        
//        [self.dataArray addObject:@{@"id":@"1",@"name":@"北京"}];
//        [self.dataArray addObject:@{@"id":@"2",@"name":@"上海"}];
//        [self.dataArray addObject:@{@"id":@"3",@"name":@"成都"}];
        
    } else {

        NSMutableArray *tmpArr = [NSMutableArray array];
        for (NSDictionary *dic in self.storeArr) {
            
            if ([dic[@"cityid"] intValue] == [self.currentCity[@"id"] intValue]) {
                
                [tmpArr addObject:dic];
            }
        }
        self.dataArray = tmpArr;
//        [self.baseTableView reloadData];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellind = @"newsitem";
    
    StoreCell *cell = [tableView dequeueReusableCellWithIdentifier:cellind];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([StoreCell class]) owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    [cell initCells:self.dataArray[indexPath.row]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 73;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [[BaseNavigationController shareBaseNavigationController:nil] showBackButton:YES];

    self.currentCity = self.dataArray[indexPath.row];

    if (self.type == ListTypeCity) {

        StoreListViewController *vc = (StoreListViewController *)[ControllerFactory storeListViewController:self.currentCity type:ListTypeStore];
        vc.storeArr = self.storeArr;
        
        [GlobalConfig push:YES
            viewController:vc
   withNavigationCotroller:self.navigationController
             animationType:ANIMATION_PUSH_TYPE
                   subType:ANIMATION_PUSH_SUBTYPE
                  Duration:DURATION
                  isToRoot:NO];
        
    } else {
        
        [GlobalConfig push:YES
            viewController:[ControllerFactory storeDetailViewController:self.currentCity[@"id"]]
   withNavigationCotroller:self.navigationController
             animationType:ANIMATION_PUSH_TYPE
                   subType:ANIMATION_PUSH_SUBTYPE
                  Duration:DURATION
                  isToRoot:NO];

    }
    
}

@end
