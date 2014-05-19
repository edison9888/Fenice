//
//  MoshGetLocation.h
//  MoshActivity
//
//  Created by mosh on 13-7-10.
//  Copyright (c) 2013年 com.mosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

typedef struct{
    double latitude;
    double longitude;
    __unsafe_unretained NSString *city;
    __unsafe_unretained NSString *coutry;

    
} MoshLocationInfo;

/*
 //类外调用如下，实现代理方法即可
 MoshGetLocation *info = [MoshGetLocation shareMoshGetLocation];
 info.delegate = self;
 [info getLocationInfo];
 */

@protocol MoshLocationInfoDelegate <NSObject>

//代理方法
- (void) getCurrentLocationInfo:(MoshLocationInfo)info;

@end

@interface MoshGetLocation : NSObject<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

@property (nonatomic, assign) id<MoshLocationInfoDelegate> delegate;

//获取用户当前地理位置信息
- (void)getLocationInfo;

//单例
+ (MoshGetLocation *) shareMoshGetLocation;



@end
