//
//  StreetEasyDetailViewController.h
//  unit-2-final-project
//
//  Created by Chris David on 10/18/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface StreetEasyDetailViewController : UIViewController <GMSMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *apartmentImageView;
@property (weak, nonatomic) IBOutlet UILabel *apartmentAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *apartmentPriceLabel;
@property (weak, nonatomic) IBOutlet GMSMapView *apartmentLocationMapImage;
@property (weak, nonatomic) IBOutlet UILabel *apartmentUnitLabel;
@property (weak, nonatomic) IBOutlet UILabel *apartmentDescriptionLabel;

@end
