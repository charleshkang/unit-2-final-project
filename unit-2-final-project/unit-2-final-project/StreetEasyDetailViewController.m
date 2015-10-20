////
////  StreetEasyDetailViewController.m
////  unit-2-final-project
////
////  Created by Chris David on 10/18/15.
////  Copyright © 2015 Charles Kang. All rights reserved.
////

//#import "StreetEasyDetailViewController.h"
//#import <GoogleMaps/GoogleMaps.h>
//#import "AppDelegate.h"
//
//@interface StreetEasyDetailViewController ()
//
//
//@end
//
//@implementation StreetEasyDetailViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.navigationController.navigationBar.hidden = NO;
//
//    GMSMarker *marker = [GMSMarker markerWithPosition:position];
//    marker.title = @"C4Q HQ";
//    marker.map = _mapView;
//    marker.appearAnimation = kGMSMarkerAnimationPop;
//    marker.icon = [GMSMarker markerImageWithColor:[UIColor blackColor]];
//
//
//    _mapView.myLocationEnabled = YES;
//    NSLog(@"User's location: %@", _mapView.myLocation);
//
//    //Controls whether the My Location dot and accuracy circle is enabled.
//
//    self.mapView.myLocationEnabled = YES;
//
//    //Controls the type of map tiles that should be displayed.
//
//    self.mapView.mapType = kGMSTypeNormal;
//
//    //Shows the compass button on the map
//
//    self.mapView.settings.compassButton = YES;
//
//    //Shows the my location button on the map
//
//    self.mapView.settings.myLocationButton = YES;
//
//    //Sets the view controller to be the GMSMapView delegate
//
//    self.mapView.delegate = self;
//
//}
//
//
//@end
//  StreetEasyDetailViewController.m
//  unit-2-final-project
//
//  Created by Chris David on 10/18/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "StreetEasyDetailViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "AppDelegate.h"

@interface StreetEasyDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *apartmentImageView;
@property (weak, nonatomic) IBOutlet UILabel *apartmentAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *apartmentPriceLabel;
@property (weak, nonatomic) IBOutlet GMSMapView *apartmentLocationMapImage;
@property (weak, nonatomic) IBOutlet UILabel *apartmentUnitLabel;
@property (weak, nonatomic) IBOutlet UITextView *apartmentDescriptionTextView;
@property (weak, nonatomic) IBOutlet GMSMapView *googleMapsMainView;

@end

@implementation StreetEasyDetailViewController {
    GMSMapView *apartmentMap;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    
    NSURL *url = [NSURL URLWithString:self.apartmentImage];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    self.apartmentImageView.image = [UIImage imageWithData:data];
    self.apartmentAddressLabel.text = self.apartmentAddress;
    self.apartmentUnitLabel.text = self.apartmentUnit;
    //  self.apartmentPriceLabel.text = self.apartmentCost;
    self.apartmentDescriptionTextView.text = self.apartmentDescription;
    
    
    //    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:<#(CLLocationDegrees)#> longitude:<#(CLLocationDegrees)#> zoom:<#(float)#>];
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinates 40.74, -73.93 at zoom level 5
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.74 longitude:-73.93 zoom:5];
    
    apartmentMap = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    apartmentMap.myLocationEnabled = YES;
    
    // solution 1 to get map the size we want
    self.view = apartmentMap;
    
    // solution 2 to get map the size we want
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectMake(0, 0, 100, 100) camera:camera];
    [apartmentMap addSubview:mapView];
    
    // creates a marker in the center of the map
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.title = @"C4Q HQ";
    marker.snippet = @"Long Island City";
    marker.map = apartmentMap;
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blackColor]];
    
    NSLog(@"User's location: %@", apartmentMap.myLocation);
    
    //Controls whether the My Location dot and accuracy circle is enabled.
    
    apartmentMap.myLocationEnabled = YES;
    
    //Controls the type of map tiles that should be displayed.
    
    apartmentMap.mapType = kGMSTypeNormal;
    
    //Shows the compass button on the map
    
    apartmentMap.settings.compassButton = YES;
    
    //Shows the my location button on the map
    
    apartmentMap.settings.myLocationButton = YES;
    

}
@end


