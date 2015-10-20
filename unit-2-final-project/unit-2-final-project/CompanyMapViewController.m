//
//  CompanyMapViewController.m
//  unit-2-final-project
//
//  Created by Lauren Caponong on 10/11/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "CompanyMapViewController.h"

// google maps key : AIzaSyAl4iC_ci94VdrvK9GpqleO9WpwFmqNtJg

@interface CompanyMapViewController ()


@end

@implementation CompanyMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;

    
    //Controls whether the My Location dot and accuracy circle is enabled.
    
    self.mapView.myLocationEnabled = YES;
    
    //Controls the type of map tiles that should be displayed.
    
    self.mapView.mapType = kGMSTypeNormal;
    
    //Shows the compass button on the map
    
    self.mapView.settings.compassButton = YES;
    
    //Shows the my location button on the map
    
    self.mapView.settings.myLocationButton = YES;
    
    //Sets the view controller to be the GMSMapView delegate
    
    self.mapView.delegate = self;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
