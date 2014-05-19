//
//  MapViewController.m
//  fenice
//
//  Created by  evafan2003 on 13-12-19.
//  Copyright (c) 2013年 mosh. All rights reserved.
//


#import <MapKit/MapKit.h>
#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id) initWithStore:(Store *)store {
    
    self = [super init];
    if (self) {
        
        self.store = store;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self convertLocation];
        
    [self showMap];
}

//将字符串转换为位置信息
-(void) convertLocation {

    // 中心点坐标（）self.latitude经度，self.longitude纬度，这是自己定义的float类型属性
//    self.store.loc = @"31.43715199999999,121.13612";
    //拆分先
    NSArray *tmpArr = [self.store.loc componentsSeparatedByString:@","];
    self.latitude = [tmpArr[0] floatValue];
    self.longitude = [tmpArr[1] floatValue];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    
    // 显示尺寸span
    MKCoordinateSpan span = MKCoordinateSpanMake(0.04, 0.04);
    
    self.mapView.region = MKCoordinateRegionMake(coordinate, span);
    
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(zoomToAnnotations) userInfo:nil repeats:NO];

}


//创建地图
-(void) showMap {
    
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 20, SCREENWIDTH, SCREENHEIGHT-20)];
    self.mapView.delegate = self;
//    self.mapView.showsUserLocation = YES;
    
    [self.view addSubview:self.mapView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//创建大头针
-(void)zoomToAnnotations {
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    annotation.title = self.store.title;
    annotation.subtitle = self.store.address;
    
    // 指定新的显示区域
    [self.mapView setRegion:MKCoordinateRegionMake(annotation.coordinate, MKCoordinateSpanMake(0.02, 0.02)) animated:YES];
    
    // 选中标注
    [self.mapView addAnnotation:annotation];
    [self.mapView selectAnnotation:annotation animated:YES];
}

@end
