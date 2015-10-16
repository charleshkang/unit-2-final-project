//
//  User.m
//  unit-2-final-project
//
//  Created by Charles Kang on 10/10/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "User.h"

@implementation User

@dynamic username;
@dynamic password;
@dynamic emailAddress;
@dynamic phoneNumber;

+ (NSString *) parseClassName {
    
    
    return @"User";
}


//- (void)myMethod {
//    PFUser *user = [PFUser user];
//    user.username = @"charles";
//    user.password = @"kang";
//    user.email = @"ckangkitchen@gmail.com";
//    
//    // other fields can be set just like with PFObject
//    user[@"phone"] = @"415-392-0202";
//    
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {   // Hooray! Let them use the app now.
//        } else {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
//        }
//    }];
//}




@end
