//
//  NSLogView.m
//  jscm
//
//  Created by mosh on 13-8-12.
//  Copyright (c) 2013年 com.mosh. All rights reserved.
//

#import "MOSHLogView.h"
#import "GlobalConfig.h"

static CGFloat buttonWidth = 20;
static CGFloat buttonHeight = 20;
static CGFloat fontSize = 15;

@implementation MOSHLogView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        self.backgroundColor = TRANSLUCECOLOR;
//        self.textView.hidden = YES;
        [self createView];
    }
    return self;
}

+ (MOSHLogView *)shareLogView
{
    static MOSHLogView *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance =[[MOSHLogView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    });
    [[[UIApplication sharedApplication] keyWindow] addSubview:instance];
    return instance;
}

+ (void) moshLog:(NSString *)text
{
    MOSHLog(@"%@",text);
    
    MOSHLogView *logView = [MOSHLogView shareLogView];
    logView.textView.text = [logView.textView.text stringByAppendingFormat:@"\n%@",text];
}

//- (void) textViewDidEndEditing:(UITextView *)textView
//{
//    [self scrollRectToVisible:CGRectMake(0, self.textView.contentSize.height, SCREENWIDTH, 0) animated:NO];
//}

- (void) createView
{
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    self.textView.backgroundColor = CLEARCOLOR;
    self.textView.font = [UIFont systemFontOfSize:fontSize];
    self.textView.text = @"！！！LOG_INFO！！！";
    self.textView.textColor = WHITECOLOR;
//    self.textView.selectable = YES;
    self.textView.editable = NO;
    [self addSubview:self.textView];
    
    UIButton *button1 = [GlobalConfig createButtonWithFrame:CGRectMake(SCREENWIDTH - buttonWidth, SCREENHEIGHT - (buttonHeight * 4), buttonWidth, buttonHeight) ImageName:nil highLightImage:nil Title:@"+" Target:self Action:@selector(increaseFontSize)];
    UIButton *button2 = [GlobalConfig createButtonWithFrame:CGRectMake(SCREENWIDTH - buttonWidth, SCREENHEIGHT - (buttonHeight * 3), buttonWidth, buttonHeight) ImageName:nil highLightImage:nil Title:@"-" Target:self Action:@selector(reduceFontSize)];
    UIButton *button3 = [GlobalConfig createButtonWithFrame:CGRectMake(SCREENWIDTH - buttonWidth, SCREENHEIGHT - (buttonHeight * 2), buttonWidth, buttonHeight) ImageName:nil highLightImage:nil Title:@"*" Target:self Action:@selector(changeFontColor)];
    UIButton *button4 = [GlobalConfig createButtonWithFrame:CGRectMake(SCREENWIDTH - buttonWidth, SCREENHEIGHT - (buttonHeight * 1), buttonWidth, buttonHeight) ImageName:nil highLightImage:nil Title:@"/" Target:self Action:@selector(addEnter)];
    
    UIButton *button5 = [GlobalConfig createButtonWithFrame:CGRectMake(SCREENWIDTH - 50, 0, 50  , 50) ImageName:nil highLightImage:nil Title:@"close" Target:self Action:@selector(closeView)];
    
    [self addSubview:button1];
    [self addSubview:button2];
    [self addSubview:button3];
    [self addSubview:button4];
    [self addSubview:button5];
    
    
    
    MOSHLogLoginView *view  =   [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MOSHLogLoginView class]) owner:self options:nil] objectAtIndex:0];
    view.delegate =self;
    [self addSubview:view];
}

- (void) increaseFontSize
{
    self.textView.font = [UIFont systemFontOfSize:++fontSize];
}

- (void) reduceFontSize
{
    if (fontSize > 0) {
        self.textView.font = [UIFont systemFontOfSize:--fontSize];
    }
}

- (void) changeFontColor
{
    self.textView.textColor = [UIColor colorWithRed:arc4random()%255/255.0f green:arc4random()%255/255.0f blue:arc4random()%255/255.0f alpha:1];
}

- (void) addEnter
{
    self.textView.text = [self.textView.text stringByAppendingFormat:@"\n/"];
}

- (void) closeView
{
    self.hidden = YES;
}

@end
