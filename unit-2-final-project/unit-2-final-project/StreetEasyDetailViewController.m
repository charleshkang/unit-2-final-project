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
@property (weak, nonatomic) IBOutlet UILabel *apartmentUnitLabel;
@property (weak, nonatomic) IBOutlet UITextView *apartmentDescriptionTextView;
@property (weak, nonatomic) IBOutlet UIView *viewForMap;


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
    self.apartmentPriceLabel.text = [NSString stringWithFormat:@"%ld",(long)self.apartmentCost];
    self.apartmentDescriptionTextView.text = self.apartmentDescription;
    
    
    
    
    
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinates 40.74, -73.93 at zoom level 5
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.74 longitude:-73.93 zoom:9];
    
    apartmentMap = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.viewForMap  =apartmentMap;
    
    
    // creates a marker in the center of the map
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(40.74, -73.93);
    
    marker.title = @"C4Q HQ";
    marker.snippet = @"Long Island City";
    marker.map = apartmentMap;
  
   [self.viewForMap addSubview:apartmentMap];
    
    // solution 1 to get map the size we want
//    self.view = apartmentMap;
    
    // solution 2 to get map the size we want SUBVIEWING NOT WORKING, CAUSES THERE TO BE 2 MAPS IN ONE VIEW!
//    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectMake(0, 0, 500, 500) camera:camera];
//    [apartmentMap addSubview:mapView];
    
    // creates a marker in the center of the map
//
//    marker.title = @"C4Q HQ";
//    marker.snippet = @"Long Island City";
//    marker.map = apartmentMap;
//    marker.appearAnimation = kGMSMarkerAnimationPop;
//    marker.icon = [GMSMarker markerImageWithColor:[UIColor blackColor]];
//    
//    NSLog(@"User's location: %@", apartmentMap.myLocation);
//    
//    //Controls whether the My Location dot and accuracy circle is enabled.
//    
//    apartmentMap.myLocationEnabled = YES;
//    
//    //Controls the type of map tiles that should be displayed.
//    
//    apartmentMap.mapType = kGMSTypeNormal;
//    
//    //Shows the compass button on the map
//    
//    apartmentMap.settings.compassButton = YES;
//    
//    //Shows the my location button on the map
//    
//    apartmentMap.settings.myLocationButton = YES;
//    
//
//    [self.viewForMap addSubview:apartmentMap];
//    

}
@end


