//
//  MapViewController.h
//  fenice
//
//  Created by  evafan2003 on 13-12-19.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseViewController.h"


@interface MapViewController : BaseViewController<MKMapViewDelegate>

@property (nonatomic, strong) Store *store;

@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, assign) CGFloat longitude;
@property (nonatomic, strong) MKMapView *mapView;

- (id) initWithStore:(Store *)store;

@end
