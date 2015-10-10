//
//  User.h
//  unit-2-final-project
//
//  Created by Charles Kang on 10/10/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "PFObject.h"
#import <Parse/Parse.h>


@interface User : PFObject <PFSubclassing>

@property (nonatomic) NSString *username;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *emailAddress;

@end