//
//  MapView.m
//  HiTaxi
//
//  Created by Sonnv on 4/18/13.
//  Copyright (c) 2013 TOPPRO. All rights reserved.
//

#import "MapView.h"
#import <QuartzCore/QuartzCore.h>

@interface Position : NSObject
{
    CLLocationCoordinate2D _position;
}
@property (nonatomic, assign) CLLocationCoordinate2D position;
@end

@implementation Position

@synthesize position = _position;

@end
#define MERCATOR_RADIUS 1000
#define MAX_GOOGLE_LEVELS 20

@interface MapView () {
    CLLocationCoordinate2D coordinate;
    CLLocation *location;
}
@end

@implementation MapView

- (id)initWithXibFile:(id <MapViewDelegate>)del {
    self = [super init];
    if (self) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"MapView" owner:nil options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[MapView class]]) {
                self = (MapView *) currentObject;
                break;
            }
        }
     [self setDelegate:del];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [[self locationManager] startUpdatingLocation];
    CLLocation *defaultLocation = [[CLLocation alloc] initWithLatitude:23 longitude:109];
    [self LoadMapToView:defaultLocation];
}

#pragma mark -
#pragma mark Location manager

/**
 Return a location manager -- create one if necessary.
 */
- (CLLocationManager *)locationManager
{
	
    if (_locationManager != nil)
    {
		return _locationManager;
	}
	
	_locationManager = [[CLLocationManager alloc] init];
	[_locationManager setDesiredAccuracy:kCLLocationAccuracyBestForNavigation];
	[_locationManager setDelegate:self];
	
	return _locationManager;
}
/**
 Conditionally enable the Add button:
 If the location manager is generating updates, then enable the button;
 If the location manager is failing, then disable the button.
 */
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
}
- (void) LoadMapToView:(CLLocation*) mlocation {
    // Configure the new event with information from the location
    coordinate = [mlocation coordinate];
    // Load map to View
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:coordinate.latitude
                                                            longitude:coordinate.longitude
                                                                 zoom:14];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize screenFrame = [[UIScreen mainScreen] bounds].size;
        if(screenFrame.height == 568){
            [self setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height +83)];
        }
        else if (screenFrame.height < 568)
        {
             [self setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        }
    }

    _mapView = [GMSMapView mapWithFrame:CGRectMake(0, 0, self.frame.size
                                                   .width, self.frame.size
                                                   .height) camera:camera];
    _mapView.settings.scrollGestures = YES;
    _mapView.delegate = self;
    _mapView.myLocationEnabled = YES;
    [self addSubview:_mapView];
    // add Marker of current position
    _option = [GMSMarker markerWithPosition:coordinate];
    UIImage *imageIcon = [UIImage imageNamed:@"ic_item1_pin.png"];
    imageIcon = [self imageWithImage:imageIcon
                        scaledToSize:CGSizeMake(47/2,68/2)];
    _option.icon = imageIcon;
    _option.map = _mapView; // replace/remove old marker
}

- (void)updateMapToView:(CLLocation*) mlocation {
    
    // Configure the new event with information from the location
    coordinate = [mlocation coordinate];
    // Load map to View
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:coordinate.latitude
                                                            longitude:coordinate.longitude
                                                                 zoom:14];
    [_mapView setCamera:camera];
    
    // custom Callview
    // adding a button in CalloutView
    
    CGRect calloutRect = CGRectZero;
    calloutRect.origin = [_mapView center];
    calloutRect.size = CGSizeZero;
    
    // add Marker of current position
    _option = [GMSMarker markerWithPosition:coordinate];
    
    //    option.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    _option.title = @"";
    _option.icon = [UIImage imageNamed:@"map.png"];
    _option.map = _mapView; // replace/remove old marker
}

#pragma mark - GMSMapViewDelegate

- (void)mapViewTapped:(UIPanGestureRecognizer *)recognizer {
   
}

#pragma mark 
- (void) zoomInMapFollowRadius:(CGFloat) zLevel
{
    [_mapView animateToZoom:zLevel];
}
- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end

