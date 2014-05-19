//
//  SilkListViewController.m
//  fenice
//
//  Created by 魔时网 on 13-12-6.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "SilkListViewController.h"
#import "SilkView.h"
#import "HTTPClient+SilkList.h"

static CGFloat buttonWidth = 34;
static CGFloat buttonHeight = 34;
static CGFloat scrollAniamtionDuration = 0.8f;

static CGFloat infoViewOffSetX = 278;
static CGFloat infoViewEndOffSetX = 278;
static CGFloat infoViewStartOffSetX = 35;
static CGFloat infoViewAnimationDuration = 0.6f;

static CGFloat alpha_start = 0.0f;
static CGFloat alpha_end = 1.0f;
static CGFloat alpha_change = 0.008f;

@interface SilkListViewController ()

@end

@implementation SilkListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil CategroyID:(NSString *)cid
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
         self.categroyID = cid;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createView];
    self.page = 0;
    self.hasMore = NO;
    self.view.backgroundColor = WHITECOLOR;
    
    //设置infoView的属性
    [self setInfoViewAtt];
    
    [self showLoadingView];
    [self downloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark initview
//设置infoView的属性
- (void) setInfoViewAtt
{
    [self infoViewFrameChangeApper:NO animation:NO];
    self.infoLabelView.alpha = alpha_start;
    [self.view bringSubviewToFront:self.infoView];
    
    //添加拖动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.infoView addGestureRecognizer:pan];
    
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.infoView addGestureRecognizer:tap];
    
}

- (void) createView
{
    //左右箭头下放连个button 接受无响应事件
    UIButton *button1 = [GlobalConfig createButtonWithFrame:CGRectMake(POINT_X + 10, (SCREENHEIGHT - NAVHEIGHT - buttonHeight)/2, buttonWidth, buttonHeight) ImageName:@"" highLightImage:@"" Title:@"" Target:self Action:@selector(noEvent)];
    [self.view addSubview:button1];
    
    UIButton *button2 = [GlobalConfig createButtonWithFrame:CGRectOffset(button1.frame, 300 - buttonWidth, 0) ImageName:@"" highLightImage:@"" Title:@"" Target:self Action:@selector(noEvent)];
    [self.view addSubview:button2];
    
    //左右箭头
    _backButton = [GlobalConfig createButtonWithFrame:button1.frame ImageName:@"silkList_back" highLightImage:@"silkList_back" Title:@"" Target:self Action:@selector(backClick)];
    [self.view addSubview:_backButton];
    
    _nextButton = [GlobalConfig createButtonWithFrame:button2.frame ImageName:@"silkList_next" highLightImage:@"silkList_next" Title:@"" Target:self Action:@selector(nextClick)];
    [self.view addSubview:_nextButton];
    
    //infoVIew
    
}


#pragma mark self.action

- (void) downloadData
{
    [[HTTPClient shareHTTPClient] getSilkListWithAlertView:self.view
                                                categroyID:self.categroyID
                                                    page:self.page
                                                   Success:^(NSArray *silkArray){
        [self hideLoadingView];
//        [self listFinishWithDataArray:silkArray];
                                                       self.dataArray = (NSMutableArray *)silkArray;
                                                       [self.baseTableView refreshData];
        [self buttonStateWhenScroll];
       [self refreshSilkInfoWhenScroll:CGPointMake(0, 0)];
                                                       
                                                       if (![GlobalConfig isKindOfNSArrayClassAndCountGreaterThanZero:silkArray]) {
                                                           [[BaseNavigationController shareBaseNavigationController:nil] setNavigationViewHidden:NO animation:YES];
                                                       }
        
    }];
}




- (void) noEvent
{
}

#pragma mark buttonClick
//点击左方向按钮
- (void) backClick
{
  CGPoint point = self.baseTableView.scrollView.contentOffset;
    if (point.x <= 0) {
        return;
    }
    [self.baseTableView.scrollView setContentOffset:CGPointMake(point.x - SCREENWIDTH, point.y) animated:YES];
    
    [self buttonClick];
}
//点击右方向按钮
- (void) nextClick
{
    CGPoint point = self.baseTableView.scrollView.contentOffset;
    if (point.x >= SCREENWIDTH * (self.dataArray.count - 1)) {
        return;
    }
    [self.baseTableView.scrollView setContentOffset:CGPointMake(point.x + SCREENWIDTH, point.y) animated:YES];
    
    [self buttonClick];
}

//点击按钮后设置按钮处于不能点击状态 等动画结束后才能继续点击、同时判断是否隐藏按钮
- (void) buttonClick
{
    [self buttonSetEnable:@NO];
    [self performSelector:@selector(buttonSetEnable:) withObject:@YES afterDelay:0.5];
    [self performSelector:@selector(horizontalScrollViewDidEndDeceletating:) withObject:nil afterDelay:0.5];
}

- (void) buttonSetEnable:(NSNumber *)enable
{
    _backButton.enabled = [enable boolValue];
    _nextButton.enabled = [enable boolValue];
}


- (void) buttonStateWhenScroll
{
    [[BaseNavigationController shareBaseNavigationController:nil] setNavigationViewHidden:YES animation:YES];
    [self checkButtonIsHidden];

}

- (void) checkButtonIsHidden
{
    _backButton.hidden = NO;
    _nextButton.hidden = NO;
    self.baseTableView.scrollView.scrollEnabled = YES;
    CGPoint point = self.baseTableView.scrollView.contentOffset;
    if (point.x/SCREENWIDTH <= 0) {
        _backButton.hidden = YES;
    }
    
    if (point.x/SCREENWIDTH >= (self.dataArray.count - 1) || self.dataArray.count == 0) {
        _nextButton.hidden = YES;
    }

}

//点击页面infoView显示头部和隐藏头部（该设计暂时不使用）
- (void) infoViewChangeWhenTouch:(BOOL)touch
{
    if (self.infoView.frame.origin.x == 0) {
        return;
    }
    else if (self.infoView.frame.origin.x == infoViewOffSetX){
        [UIView animateWithDuration:0.3f animations:^{
            CGRect rect = self.infoView.frame;
            rect.origin.x = infoViewEndOffSetX;
            self.infoView.frame = rect;
        }];
    }
    else if (self.infoView.frame.origin.x == infoViewEndOffSetX){
        [UIView animateWithDuration:0.3f animations:^{
            CGRect rect = self.infoView.frame;
            rect.origin.x = infoViewOffSetX;
            self.infoView.frame = rect;
        }];
    }
}

//滚动到正确的位置 （滑动结束后调用）
- (void) scrollToCorrectRect
{
    CGFloat x = self.baseTableView.scrollView.contentOffset.x;
    x =  (NSInteger) ((x / SCREENWIDTH) + 0.5);

    x = x * SCREENWIDTH;
    [self.baseTableView scrollToContentOffSet: CGPointMake(x, 0) aniDuration:scrollAniamtionDuration];
    
    //动画后更新丝巾信息
    [self refreshSilkInfoWhenScroll:CGPointMake(x, 0)];
    [self buttonStateWhenScroll];
    
}

//滚动时更新丝巾信息
- (void) refreshSilkInfoWhenScroll:(CGPoint)point
{
    NSInteger i = point.x/SCREENWIDTH;
    if (self.dataArray.count > i) {
        NSArray *array = self.dataArray[i];
        if (array.count > 0) {
            SilkModel *model = (SilkModel *)array[0];
            [self silkVIewInfoChange:model];
        }
    }
}

//更新丝巾信息
- (void) silkVIewInfoChange:(SilkModel *)silk
{
    self.numberLabel.text = silk.sid;
    self.textureLabel.text = silk.texture;
    self.sizeLabel.text = silk.size;
    self.priceLabel.text = silk.price;
}

#pragma mark gesture
//infoVIew拖动
- (void) pan:(UIPanGestureRecognizer *)pan
{
    CGPoint offSet = [pan translationInView:self.infoView];
    static CGFloat beginPoint;
    static silkInfoViewPanDiretion diretion;
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        beginPoint = 0;
    }
    else if (pan.state == UIGestureRecognizerStateChanged) {
        
        //超出0点手势无效
        if (self.infoView.frame.origin.x < infoViewStartOffSetX) {
            return;
        }
        //infoView随手势滑动
        self.infoView.frame = CGRectOffset(self.infoView.frame, offSet.x - beginPoint, 0);
        
            if (offSet.x > beginPoint) {
                self.infoLabelView.alpha = self.infoLabelView.alpha - alpha_change;
                diretion = SilkInfoViewPanDiretionRight;
            }
            else {
                self.infoLabelView.alpha = self.infoLabelView.alpha + alpha_change;
                diretion = silkInfoViewPanDiretionLeft;
            }
        
        beginPoint = offSet.x;
    }
    else if (pan.state == UIGestureRecognizerStateEnded) {
        
        //查看手指触摸方向，根据方向判断隐藏还是显示
        switch (diretion) {
            case silkInfoViewPanDiretionLeft:
                [self infoViewFrameChangeApper:YES animation:YES];
                break;
            case SilkInfoViewPanDiretionRight:
                [self infoViewFrameChangeApper:NO animation:YES];
            default:
                break;
        }
        
    }
}

//infoVIew点击
- (void) tap:(UITapGestureRecognizer *)tap
{
    if (self.infoView.frame.origin.x == infoViewStartOffSetX) {
        [self infoViewFrameChangeApper:NO animation:YES];
    }
    else if (self.infoView.frame.origin.x == infoViewOffSetX){
        [self infoViewFrameChangeApper:YES animation:YES];
    }
}

//infoView显示和隐藏
- (void) infoViewFrameChangeApper:(BOOL)apper animation:(BOOL)animation
{
    CGRect rect = self.infoView.frame;
    CGFloat alpha = 0;
    CGFloat duration = 0;
    if (!apper) {
        rect.origin.x = infoViewEndOffSetX;
        alpha = alpha_start;
    }
    else {
        rect.origin.x = infoViewStartOffSetX;
        alpha = alpha_end;
    }
    
    if (animation) {
        duration = infoViewAnimationDuration;
    }
    
        [UIView animateWithDuration:duration animations:^{
            self.infoView.frame = rect;
            self.infoLabelView.alpha = alpha;
        }];
}

#pragma  mark silkViewDelegate
- (void) silkViewIsTouch:(BOOL)isTouch
{
    //导航隐藏
    [[BaseNavigationController shareBaseNavigationController:nil] setNavigationViewHidden:!isTouch animation:YES];
    
    //infoVIew隐藏
//    [self infoViewChangeWhenTouch:isTouch];
    
    //按钮检查隐藏
    [self checkButtonIsHidden];
}

#pragma  mark horizontalDelegate
- (UIView *)tableView:(HorizontalTableView *)tableView viewForIndex:(NSInteger)index
{
    SilkView *cell = (SilkView *)[tableView dequeueColumnView];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SilkView class]) owner:self options:nil] objectAtIndex:0];
        cell.delegate = self;
        [cell initWithDataArray:self.dataArray[index]];
    }
    
    [cell reloadDataWithSilkArray:self.dataArray[index]];

//    [self downloadMore:index];
    return cell;
    
}

- (void) horizontalScrollViewDidEndDeceletating:(HorizontalTableView *)tableView
{
    // 滚动停止后更新左右按钮显示状态 scrollview滑动到正确位置
    [self buttonStateWhenScroll];
    [self scrollToCorrectRect];
    
    //滚动时更新infoVIew的信息
    [self refreshSilkInfoWhenScroll:self.baseTableView.scrollView.contentOffset];

}

- (void) horizontalScrollViewDidEndDragging:(HorizontalTableView *)tableView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
            // 滚动停止后更新左右按钮显示状态 scrollview滑动到正确位置
        [self buttonStateWhenScroll];
        [self scrollToCorrectRect];
        
        //滚动时更新infoVIew的信息
        [self refreshSilkInfoWhenScroll:self.baseTableView.scrollView.contentOffset];

    }
}

- (void) horizontalScrollViewDidScroll:(HorizontalTableView *)tableView
{
      [self buttonStateWhenScroll];
    
    //滚动时将infoVIew缩回
    if (self.infoView.frame.origin.x != infoViewEndOffSetX) {
        [self infoViewFrameChangeApper:NO animation:YES];
    }
}


@end
