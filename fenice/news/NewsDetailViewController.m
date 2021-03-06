//
//  NewsDetailViewController.m
//  fenice
//
//  Created by  evafan2003 on 13-12-9.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "News.h"
#import "HTTPClient+News.h"
#import <MediaPlayer/MPMoviePlayerViewController.h>
#import <MediaPlayer/MPMoviePlayerController.h>
#import "NewsCell.h"
#import "RotateVIew.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithNid:(NSString *)nid
{
    
    self = [super init];
    if (self) {
        self.nid = nid;
    }
    return self;
}


//获取数据
-(void) downloadData {


    [self showLoadingView];

    [[HTTPClient shareHTTPClient] getNewsDetailWithId:self.nid view:self.view sucess:^(NSDictionary *dic){

        self.news = [News news:dic];
//        self.news = [News news:@{@"nid":@"1",@"title":@"费尼琦开幕盛典",@"content":@"费尼琦北京店于2013.10.25",@"addtime":@"1386647378",@"imgUrl":@""}];
//        self.news.content = @"费尼琦北京店于2013.10.25费尼琦北京店于2013.10.25费尼琦北京店于2013.10.25费尼琦北京店于2013.10.25费尼琦北京店于2013.10.25";
//        self.news.video = @"http://player.youku.com/embed/XNDI0MDQ1Mzk2";
//        self.news.picture = (NSMutableArray *)@[@"http://115.28.10.161/upload/images/20141/2014191923206312810.jpg",@"http://f.hiphotos.baidu.com/image/w%3D2048/sign=97cf3dc7e2fe9925cb0c6e5000905fdf/7e3e6709c93d70cf96218f0ffadcd100bba12bdc.jpg"];
        
        if (self.news != nil) {
            
            //有视频不要图片
            if (self.news.video.length>0) {
                self.news.picture = [NSMutableArray array];
            }
            
            NewsDetailCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:self options:nil]objectAtIndex:1];
            [cell initCells:self.news];
            
            self.baseTableView.tableHeaderView = cell;
            
            [self.baseTableView reloadData];
            
        }
        [self hideLoadingView];
    }];
    
}

//来个webview
- (void) createWebView:(UITableViewCell *)cell {
    
    UIWebView *view = [[UIWebView alloc]initWithFrame:CGRectMake(10, 0, 300, 200)];
    view.scrollView.bounces = NO;
    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.news.video]]];
    [cell addSubview:view];
}

- (void) movieFinishedCallback:(id)sender {
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.baseTableView.frame = CGRectMake(0, 20, SCREENWIDTH, SCREENHEIGHT-20);
    self.hasImage = 1;
    self.currentImage = [NSMutableArray arrayWithCapacity:0];
    [self downloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 1) {
        return self.news.picture.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {   //视频

        static NSString *cellIdentifier = @"news";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = CLEARCOLOR;
        }

        if (self.news.video.length>0) {
            //视频
            [self createWebView:cell];
            
        }
        return cell;
        
    } else if (indexPath.section == 2) {    //内容
        
        NewsContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsContent"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NewsCell class]) owner:self options:nil] objectAtIndex:2];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        //正文
        CGSize size = [self getAdjustSide];
        cell.detail.frame = CGRectMake(20, 5, 280, size.height);
        cell.detail.text = self.news.content;
        cell.detail.lineBreakMode = NSLineBreakByWordWrapping;
        cell.detail.backgroundColor = [UIColor clearColor];
        cell.detail.font = [UIFont systemFontOfSize:14];
        cell.detail.numberOfLines = 0;
        cell.detail.textColor  = [UIColor grayColor];
        
        return cell;
        
    } else {    //图片们
        
        NewsImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsImage"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NewsCell class]) owner:self options:nil] objectAtIndex:3];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }

        NSDictionary *dic = self.news.picture[indexPath.row];
        NSString *str = dic[@"url"];

        //图片
        if (str.length>0 && self.hasImage <= self.news.picture.count) {
            
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
            [cell.detailImage setImageWithURLRequest:request
                             placeholderImage:nil
                                      success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image){
                                          
                                          [self successWithImage:image inCell:cell];
                                      }
                                      failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error){
                                          [self failure];
                                          
                                      }];
        }
        return cell;
        
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return (self.news.video.length>0)?200:0;
        
    } else if (indexPath.section == 2) {

        CGSize size = [self getAdjustSide];
        return size.height;
        
    } else {
        if (self.currentImage.count>0) {

            UIImage *image = [self.currentImage objectAtIndex:indexPath.row];
            CGSize size = [self getImageSize:image];
            return size.height;
        }
        return 0;

    }
}

- (CGSize) getAdjustSide
{
    CGSize size = [self.news.content sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(280, 20000) lineBreakMode:NSLineBreakByCharWrapping];
    size.height += 60;
    return size;
}

-(CGSize )getImageSize:(UIImage *)image {
    
    CGSize size = image.size;
    
    if (size.width > 320) {
        CGFloat scale = size.width/320;
        size.width = 320;
        size.height = size.height / scale;
    }
    
    return size;
}

//成功
- (void) successWithImage:(UIImage *)image inCell:(NewsImageCell *) cell
{
    [self hideLoadingView];
    [self.currentImage addObject:image];
    cell.detailImage.image = image;
    cell.detailImage.contentMode = UIViewContentModeScaleAspectFit;
    
    if (self.hasImage == self.news.picture.count) {

        [self.baseTableView reloadData];
    }
    self.hasImage ++;

}




//失败
- (void) failure
{
    [self hideLoadingView];
}

@end
