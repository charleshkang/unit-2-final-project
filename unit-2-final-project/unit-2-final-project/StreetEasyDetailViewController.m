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
@property (weak, nonatomic) IBOutlet UITextView *apartmentDescriptionTextView;

@end

@implementation StreetEasyDetailViewController

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
    





}
@end
