//
//  URLDefine.h
//  modelTest
//
//  Created by mosh on 13-10-29.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JSONKEY     @"res"

#define MD5KEY      @"keyskykeysky"

/*
 网址
 */
//#define MOSHHOST        @"http://115.28.5.8/app/index.aspx?" //host 线下
#define MOSHHOST      @"http://115.28.10.161/app/index.aspx?"//线上
//
#define URL_NAVTITLE    @"type=index"

#define URL_COLLECT     @"type=productcategory"  //COLLECT
//#define URL_SILKLIST    @"type=productlist&id=%@&pagesize=%d"//丝巾列表
#define URL_SILKLIST    @"type=productlist&id=%@&pagenum=10000"//丝巾列表

#define URL_NEWS        @"type=news&pagesize=%d" //新闻列表
#define URL_NEWSDETAIL  @"type=newsdetail&id=%@" //新闻详情

#define URL_STORELIST   @"type=storelist"  //STORE
#define URL_STOREDETAIL @"type=storedetail&id=%@"//store详情

#define URL_VERSION     @"type=version&version=%.1f&appid=%@" //版本更新

/*
 缓存
 */
#define CACHE_NAVTITLE          @"TITLE" // NAVTITLE

#define CACHE_COLLECT           @"COLLECT" //COLLECT
//#define CACHE_SILKLIST          @"SILKLISTPAGE%@%d"//丝巾列表 id page
#define CACHE_SILKLIST          @"SILKLISTID%@"//丝巾列表 id page

#define CACHE_NEWSLIST          @"ACTIVITYLISTPAGE%d"//新闻列表
#define CACHE_NEWSDETAIL        @"NESDETAILNID%@"//新闻详情

#define CACHE_STORE             @"STORE"//STORE
#define CACHE_STORELIST          @"STORELISTPAGE%d"//STORE列表
#define CACHE_STOREDETAIL        @"STOREDETAILNID%@"//STORE详情


//加密
#define DESKEY                      @"d51da0e7ae40b437"
#define LOGINHOST                   @"http://api.mosh.cn/moshevent/"

/*
 分享
 */
//新浪
#define SINA_APPKEY             @"4131504527"
#define SINA_APPSECRET          @"f96fe8b50c08f31ee232ea5fa41f299b"
#define URI                     @"http://www.moshapp.com"

//本地保存的内容（不能修改）
#define SINA_USERINFO_ACCESSTOKEN       @"AccessTokenKey"
#define SINA_USERINFO_EXPITATIONDATE    @"ExpirationDateKey"
#define SINA_USERINFO_USERID            @"UserIDKey"

#define TENCENT_USERINFO_ACCESSTOKEN    @"TKSDKaccessToken"
#define TENCENT_USERINFO_EXPIRATIONDATE @"TKSDKexpireTime"
#define TENCENT_USERINFO_OPENID         @"TKSDKopenId"
#define TENCENT_USERINFO_REFRESHDATE    @"TKSDKrefreshToken"

//点击微信分享后进入的链接
#define LINKURL                 @"www.moshapp.com/mao"
//活动易购票链接 %@为eid
#define BUYURL                  @"http://e.mosh.cn/%@"

//微信
#define WEIXIN_APPKEY           @"wx965d46391450bba5"
#define WEIXIN_APPSECRET        @"ce35f0396b31ecedd4fa96bc7bbfc1d3"

//mosh登录
//新浪微博
#define MOSH_SINA_APPKEY             @"89207806"
#define MOSH_SINA_APPSECRET          @"c37b635b2ec943e8bf08932e6036d205"
#define MOSH_SINA_REDIRECTURI        @"http://www.mosh.cn/binding/?custom=weibo"
//人人
#define MOSH_RENREN_APPID            @"237254"
#define MOSH_RENREN_APPKEY           @"1ec54fe39d3f43b887069ef1640f0911"
#define MOSH_RENREN_APPSECRET        @"66dac70a379a4221adfd2c9308ba0aa7"
#define MOSH_RENREN_REDIRECTURL      @"http://www.mosh.cn/binding/?custom=renren"

//QQ
#define MOSH_QQ_APPKEY               @"100263502"
#define MOSH_QQ_APPSECRET            @"f816e5c383abe9800f97de50d7410b67"
#define MOSH_QQ_REDIRECTURL          @"http://www.mosh.cn/binding/?custom=qq"

//豆瓣
#define MOSH_DOUBAN_APPKEY           @"01edb6fb77e5fb2105c924f267b1f163"
#define MOSH_DOUBAN_APPSECRET        @"a14688cdf9b7aca7"
#define MOSH_DOUBAN_REDIRECTURL      @"http://www.mosh.cn/binding/?custom=douban"

//淘宝
#define MOSH_TAOBAO_APPKEY           @"21551386"
#define MOSH_TAOBAO_APPSECRET        @"760426897433388725bc9195f562abd5"
#define MOSH_TAOBAO_REDIRECTURL      @"http://www.mosh.cn/binding/?custom=taobao"

//腾讯微博
#define MOSH_TENCENT_APPKEY          @"801336858"
#define MOSH_TENCENT_APPSECRET       @"9239362c664e906c13986c3a5d94a495"
#define MOSH_TENCENT_REDIRECTURL     @"http://www.mosh.cn/binding/?custom=t_weibo"


/*
 第三方登录使用
 本地保存 格式如下
 { USER_KEYSINA:{USER_THIRDACCESSTOKEN:@"",USER_THIRDUSERID:@"",USER_THIRDEXPDATE;@""},
 USER_KEYQQ:
 {USER_THIRDACCESSTOKEN:@"",USER_THIRDUSERID:@"",USER_THIRDEXPDATE;@""}}
 */
#define USER_THIRDINFO              @"userThirdLogin"//第三方登录信息
#define USER_KEYSINA                @"userSina"//第三方登录信息内字典key
#define USER_KEYRENREN              @"userRenren"
#define USER_KEYDOUBAN              @"userDouban"
#define USER_KEYQQ                  @"userQQ"
#define USER_KEYTAOBAO              @"userTaobao"
#define USER_KEYTENCENT             @"userTencent"
#define USER_THIRDACCESSTOKEN       @"userAccessToken"//第三方token
#define USER_THIRDUSERID            @"userthirdUserId"//第三方id
#define USER_THIRDEXPDATE           @"userExpiresDate"//有效期  过期时间 = 授权时间 + 有效期
#define USER_THIRDAUTHDATE          @"userAuthdate" //授权时间
#define USER_THIRDNICKNAME          @"userNickName" // 用户昵称
#define USER_USERID                 @"userId"       //用户id
#define USER_USERNAME               @"userName"     //用户名
#define USER_PASSWORD               @"userPassword" //密码
#define USER_PHONE                  @"userPhone"    //手机号
#define USER_EMAIL                  @"userEmail"    //邮箱
#define USER_CITY                   @"userCity"     //城市
#define USER_IMAGE                  @"userImage"    //头像
#define USER_BINDING                @"userBinding"  //绑定
#define USER_GENDER                 @"userGender"   //性别
#define CITYNAME                    @"CityName"     //gps城市名称
#define CITYID                      @"CityId"       //gps城市代码



@interface URLDefine : NSObject

@end
