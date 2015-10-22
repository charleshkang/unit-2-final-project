//
//  SignUpLoginViewController.m
//  unit-2-final-project
//
//  Created by Lauren Caponong on 10/10/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "SignUpLoginViewController.h"

@interface SignUpLoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *signUpButtonTapped;
@property (weak, nonatomic) IBOutlet UIButton *loginButtonTapped;

@end

@implementation SignUpLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [[self.signUpButtonTapped layer] setBorderWidth:2.0f];
    [[self.signUpButtonTapped layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    [[self.loginButtonTapped layer] setBorderWidth:2.0f];
    [[self.loginButtonTapped layer] setBorderColor:[UIColor whiteColor].CGColor];
    [self.view endEditing:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
