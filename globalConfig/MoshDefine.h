//
//  MoshDefine.h
//  modelTest
//
//  Created by mosh on 13-10-21.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>

//基点
#define POINT_X     0
#define POINT_Y     0

//宏定义NSLog

#define _DEBUG

#ifdef	_DEBUG
#define	MOSHLog(...);	NSLog(__VA_ARGS__);
#define	MOSHDUGLog(object) 	[MOSHLogView moshLog:[object description]]
#define MOSHLogMethod	NSLog( @"[%s] %@", class_getName([self class]), NSStringFromSelector(_cmd) );
#else
#define MOSHLog(...);
#define	MOSHDUGLog(object)
#define MOSHLogMethod
#endif

//宏定义屏幕的宽和高

#define SCREENWIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT    [UIScreen mainScreen].bounds.size.height
#define NAVHEIGHT       ([GlobalConfig versionIsIOS7]? 0 : 0)
#define NAVIMAGE       ([GlobalConfig versionIsIOS7]? @"navBg_ios7" : @"navBg")
#define STATEHEIGHT     ([GlobalConfig versionIsIOS7]? 0 : 20)
#define TABBARHEIGHT    49


//解决arc中performselector警告问题
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


//宏定义颜色

#define CLEARCOLOR              [UIColor clearColor]
#define WHITECOLOR              [UIColor whiteColor]
#define BLACECOLOR              [UIColor blackColor]
#define REDCOLOR				[UIColor redColor]
#define BACKGROUND              [UIColor whiteColor]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define NORMAL_COLOR				[UIColor colorWithRed:151/255.0f green:151/255.0f blue:151/255.0f alpha:1]

#define NAVBAR_TINT_COLOR			[UIColor colorWithRed:44/255.0f green:44/255.0f blue:44/255.0f alpha:1]

#define TEXTGRAYCOLOR               [UIColor colorWithRed:187/255.0f green:189/255.0f blue:191/255.0f alpha:1]

#define TRANSLUCECOLOR      [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5]

#define IMAGECOLOR(object) [UIColor colorWithPatternImage:[UIImage imageNamed:[object description]]]

//图片
#define PLACEHOLDERIMAGE_VERTICAL        [UIImage imageNamed:@"vertical_pic@2x.png"]
#define PLACEHOLDERIMAGE_HORIZONTAL  [UIImage imageNamed:@"horizontal_pic@2x.png"]
#define PLACEHOLDERIMAGE_SQUARE      [UIImage imageNamed:@"square_pic@2x.png"]
//

#define iPodTouchString				@"iPod touch"
#define iPadString                  @"iPad"
#define DeviceType                  @"设备类型"
#define System                      @"系统版本"

//字体名称
#define REQUIREFONTNAME             @"FreeSerifItalic"

#define CURRENTAPPID                @""//用于评分

#define NAV_FONT                    [UIFont systemFontOfSize:20];
#define BUTTON_FONT                 [UIFont boldSystemFontOfSize:13];

#define NSArrayClass                [NSArray class]
#define NSDictionaryClass           [NSDictionary class]
#define NSStringClass               [NSString class]

//动画时间
#define DURATION                      1.5
#define DURATION_SECOND               1.5
#define ANIMATION_PUSH_TYPE           3
#define ANIMATION_PUSH_SUBTYPE        3
#define ANIMATION_POP_TYPE            3
#define ANIMATION_POP_SUBTYPE         4

#define ANIMATION_SHOW_TYPE            3
#define ANIMATION_LEFT_SUBTYPE         1
#define ANIMATION_RIGHT_SUBTYPE        2

//时间格式
#define DATEFORMAT_01              @"yyyy.MM.dd HH:mm:ss"
#define DATEFORMAT_02              @"yyyy.MM.dd HH:mm"
#define DATEFORMAT_03              @"yyyy.MM.dd"
#define DATEFORMAT_04              @"yyyy.MM"
#define DATEFORMAT_05              @"yyyy-MM-dd"
#define DATEFORMAT_06              @"yyyy年MM月dd日"

#define LOADING						@"正在加载..."
#define LOADINGMORE                 @"正在加载更多内容"
#define ERROR						@"网络连接失败，请重试。"
#define ERROR_READCACHE             @"加载失败，读取缓存"
#define ERROR_LOADINGFAIL           @"加载失败，请检查网络连接"
#define ERROR_EMPTYDATA             @"内容暂未更新，不要着急哦~~"
#define ERROR_USERNAME              @"用户名不能为空"
#define ERROR_PASSWORD              @"密码不能为空"
#define ERROR_LOGINFAIL             @"登录失败，请检查用户名和密码"

#define BUTTON_OK					@"确定"
#define BUTTON_CANCEL				@"取消"

#define UPDATE_TITIE				@"升级提示"
#define NO_NEW_VERSION				@"未发现新版本，当前安装的已是最新版本。"
#define HAS_NEW_VERSION				@"发现新版本，现在是否升级？"

#define kCallNotSupportOnIPod		@"该设备不支持打电话功能！"
#define kSmsNotSupportOnIPod		@"该设备不支持发短信功能！"
#define kOptionNotSupport			@"您的设备不支持该项功能！"
#define ERROR_COLLECT               @"收藏功能需要登录后才能使用！"

#define COLLECT_ADDSUCCESS          @"收藏成功"
#define COLLECT_ADDFAILED           @"收藏失败"
#define COLLECT_DELSUCCESS          @"移除收藏成功"
#define COLLECT_DELFAILED           @"移除收藏失败"

//标题
#define NAVTITLE_LOGIN              @"登录"
#define NAVTITLE_ACTIVITYLIST       @"活动易"
#define NAVTITLE_ACTIVITYSTA        @"活动统计"
#define NAVTITLE_TOP10              @"来源TOP10"
#define NAVTITLE_TICKETSTA          @"票种统计"
//占位符
#define PLACE_SEARCH                @"请输入查询内容"

#define NO_LOCATION                @"找不到任何店铺的位置信息"
#define GETLOCATION_FAIL            @"获取地理位置失败"

@interface MoshDefine : NSObject

@end
