//
//  ViewController.m
//  unit-2-final-project
//
//  Created by Charles Kang on 10/10/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    User *user = [[User alloc] init];
    user.username = @"Charles";
    user.password = @"c4q";
    user.emailAddress = @"ckangkitchen@gmail.com";
    
    [user saveInBackground];
    
    // this is code before doing parse stuff
    
    //    PFObject *car = [PFObject objectWithClassName:@"Car"];
    //
    //    car[@"model"] = @"Tesla";
    //    car[@"year"] = @1995;
    //    car[@"numberOfWheels"] = @5;
    //
    //    [car saveInBackground];
    //    
    //}
    
}



@end
