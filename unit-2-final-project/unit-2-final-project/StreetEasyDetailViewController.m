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
@property (weak, nonatomic) IBOutlet UIButton *addNoteButtonTapped;



@end

@implementation StreetEasyDetailViewController {
    GMSMapView *apartmentMap;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    
    //start apartment text view description at the top
    [self.apartmentDescriptionTextView scrollRangeToVisible:NSMakeRange(0, 0)];
    
    
    NSURL *url = [NSURL URLWithString:self.apartmentImage];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    self.apartmentImageView.image = [UIImage imageWithData:data];
    self.apartmentAddressLabel.text = self.apartmentAddress;
    self.apartmentUnitLabel.text = self.apartmentUnit;
    
    self.apartmentPriceLabel.text = [NSString stringWithFormat:@"Price:$%ld",(long)self.apartmentCost];
    
    self.apartmentDescriptionTextView.text = self.apartmentDescription;
    
    //add border to add note button
    [[self.addNoteButtonTapped layer] setBorderWidth:2.0f];
    [[self.addNoteButtonTapped layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    
    
    float lat = [self.apartmentLatitude floatValue];
    float lon = [self.apartmentLongitude floatValue];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:lat longitude:lon zoom:15];
    
    apartmentMap = [GMSMapView mapWithFrame:self.view.frame camera:camera];
    apartmentMap.myLocationEnabled = YES;
    //self.viewForMap = apartmentMap;
    
    
    // creates a marker in the center of the map
    GMSMarker *marker = [[GMSMarker alloc] init];
    
    marker.position = CLLocationCoordinate2DMake(lat, lon);
    
    marker.title = self.apartmentAddress;
    marker.snippet = @"New York City";
    
    marker.map = apartmentMap;
    
    GMSCameraUpdate *camUpdate = [GMSCameraUpdate setTarget:marker.position zoom:10.0];
    [apartmentMap animateWithCameraUpdate:camUpdate];
    [self.viewForMap addSubview:apartmentMap];
    [apartmentMap animateToCameraPosition:camera];
    [apartmentMap animateToLocation:camera.target];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    float lat2 = [self.apartmentLatitude floatValue];
    float lon2 = [self.apartmentLongitude floatValue];
    [apartmentMap animateToLocation:CLLocationCoordinate2DMake(lat2, lon2)];
}
@end


