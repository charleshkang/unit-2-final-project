//
//  StreetEasyDetailViewController.h
//  unit-2-final-project
//
//  Created by Chris David on 10/18/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface StreetEasyDetailViewController : ViewController <GMSMapViewDelegate>


@property (nonatomic) NSString *apartmentImage;
@property (nonatomic) NSString *apartmentAddress;
@property (nonatomic) NSString *apartmentPrice;
@property (nonatomic) NSString *apartmentUnit;
@property (nonatomic) NSString *apartmentDescription;


@end
