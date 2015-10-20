////
////  LocationMapViewController.m
////  unit-2-final-project
////
////  Created by Lauren Caponong on 10/11/15.
////  Copyright © 2015 Charles Kang. All rights reserved.
////
//
//#import "LocationMapViewController.h"
//#import "AppDelegate.h"
//
//// google maps key : AIzaSyAl4iC_ci94VdrvK9GpqleO9WpwFmqNtJg
//
//@interface LocationMapViewController ()
//
//- (IBAction)backButton:(id)sender;
//
//@end
//
//@implementation LocationMapViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.navigationController.navigationBar.hidden = YES;
//    // c4q coordinates 40.742903, -73.935536
//    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(40.742903, -73.935536);
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
//    
//
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
//    
//    
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//- (IBAction)backButton:(id)sender {
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
//
//}
//@end
