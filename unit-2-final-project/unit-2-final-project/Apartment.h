//
//  Apartment.h
//  unit-2-final-project
//
//  Created by Chris David on 10/18/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Apartment : NSObject


@property (nonatomic) NSInteger apartmentPrice;

@property (nonatomic) NSString *iconName;
@property (nonatomic) NSString *apartmentForRent;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *unit;
@property (nonatomic) NSString *apartmentDescription;
@property (nonatomic) CGFloat longitude;
@property (nonatomic) CGFloat latitude; 

@end
