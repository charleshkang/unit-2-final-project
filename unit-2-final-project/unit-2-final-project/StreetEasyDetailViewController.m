//
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
@property (weak, nonatomic) IBOutlet UILabel *apartmentDescriptionLabel;

@end

@implementation StreetEasyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    
    self.apartmentImageView.image = [UIImage imageNamed:self.apartmentImage];

//    self.apartmentLocationMapImage.accessibilityElementsHidden = NO;
    
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(40.742903, -73.935536);
    
    GMSMarker *marker = [GMSMarker markerWithPosition:position];
    marker.title = @"C4Q HQ";
    marker.map = _apartmentLocationMapImage;
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blackColor]];
    
    //Controls whether the My Location dot and accuracy circle is enabled.
    
    self.apartmentLocationMapImage.myLocationEnabled = YES;
    
    //Controls the type of map tiles that should be displayed.
    
    self.apartmentLocationMapImage.mapType = kGMSTypeNormal;
    
    //Shows the my location button on the map
    
    self.apartmentLocationMapImage.settings.myLocationButton = YES;
    
    //Sets the view controller to be the GMSMapView delegate
    
    self.apartmentLocationMapImage.delegate = self;
    
}

- (void)removeOverlays:(NSArray<id<GMSMapViewDelegate>> * _Nonnull)overlays {

}

@end
