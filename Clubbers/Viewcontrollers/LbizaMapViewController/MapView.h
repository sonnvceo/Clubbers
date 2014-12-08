//
//  MapView.h
//  HiTaxi
//
//  Created by Sonnv on 4/18/13.
//  Copyright (c) 2013 TOPPRO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>

@protocol MapViewDelegate;

@interface MapView : UIView <CLLocationManagerDelegate,
                                    GMSMapViewDelegate,
                                UIGestureRecognizerDelegate>

- (id)initWithXibFile:(id <MapViewDelegate>)del;


@property (nonatomic, retain) id <MapViewDelegate> delegate;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) GMSMapView *mapView;
@property (nonatomic, retain) GMSMarker *option ;

@end
@protocol MapViewDelegate

@end

