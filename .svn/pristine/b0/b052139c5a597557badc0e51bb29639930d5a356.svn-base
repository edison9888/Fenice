//
//  MoshGetLocation.m
//  MoshActivity
//
//  Created by mosh on 13-7-10.
//  Copyright (c) 2013年 com.mosh. All rights reserved.
//

#import "MoshGetLocation.h"
#import "GlobalConfig.h"

static MoshGetLocation *instance;

@implementation MoshGetLocation

+ (MoshGetLocation *) shareMoshGetLocation
{
    if (!instance) {
        instance = [[MoshGetLocation alloc] init];
    }
    return instance;
}

//通过GPS获得城市名称
- (void)getLocationInfo {
    
    //调用单例
    MoshGetLocation *location = [MoshGetLocation shareMoshGetLocation];
    
    locationManager = [[CLLocationManager alloc] init];//创建位置管理器
    locationManager.desiredAccuracy = kCLLocationAccuracyBest; //指定需要的精度级别
    
    locationManager.distanceFilter = kCLDistanceFilterNone;
    
    locationManager.delegate = location;
    
    [locationManager startUpdatingLocation]; //启动位置管理器
    
}

//获取位置成功
- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [manager stopUpdatingLocation];
    
    CLLocationDegrees latitude = newLocation.coordinate.latitude; //获得当前位置的纬度

    CLLocationDegrees longitude = newLocation.coordinate.longitude;

    MOSHLog(@"latitude%f",latitude);

    MOSHLog(@"longitude%f",longitude);
    
    //根据经纬度获取地理位置
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks,NSError *error){
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];

            NSDictionary *dic = placemark.addressDictionary;
            NSString *country = dic[@"Country"];
            NSString *city = dic[@"State"];
            
            MoshLocationInfo info;
            info.latitude = latitude;
            info.longitude = longitude;
            info.city = city;
            info.coutry = country;

            [self.delegate getCurrentLocationInfo:info];
        }
    }];

}

//获取位置失败
- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
     [manager stopUpdatingLocation];
    
    MoshLocationInfo info;
    info.latitude = 0;
    info.longitude = 0;
    info.city = @"";
    info.coutry = @"";
    
    [self.delegate getCurrentLocationInfo:info];
    
}




@end
