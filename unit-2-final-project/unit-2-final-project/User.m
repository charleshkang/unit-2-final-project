//
//  User.m
//  unit-2-final-project
//
//  Created by Charles Kang on 10/10/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "User.h"

@implementation User

//@dynamic username;
@dynamic password;
@dynamic emailAddress;
@dynamic phoneNumber;

+ (NSString *) parseClassName {
    
    
    return @"User";
}

@end
