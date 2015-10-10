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
    // Do any additional setup after loading the view.
    
    
    NSLog(@"TESTING TESTING 123 4:39PM OCTOBER 10");
    // ayy lmao
    
    
    [[self.signUpButtonTapped layer] setBorderWidth:2.0f];
    [[self.signUpButtonTapped layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    [[self.loginButtonTapped layer] setBorderWidth:2.0f];
    [[self.loginButtonTapped layer] setBorderColor:[UIColor whiteColor].CGColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
