//
//  ApartmentListingsTableViewCell.h
//  unit-2-final-project
//
//  Created by Chris David on 10/18/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApartmentListingsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *apartmentImage;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *apartmentNumber;

@end
