//
//  ViewController.m
//  unit-2-final-project
//
//  Created by Charles Kang on 10/10/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFUser *user = [[PFUser alloc] init];
    user.username = @"chris";
    user.password = @"puppy";
    user.email = @"charleskang@gmail.com";
    
    [user signUpInBackground];
    [user saveInBackground];
    

    
}

@end
