//
//  EntryCreationViewController.m
//  unit-2-final-project
//
//  Created by Lauren Caponong on 10/11/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "EntryCreationViewController.h"
#import "Entry.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>


@interface EntryCreationViewController ()

@property (nonatomic) NSMutableArray *journalEntries;


@end

@implementation EntryCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    // this line is probably incorrect
    self.journalEntries = [self.journalEntries mutableCopy];
    
    //AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    self.locationTextfield.layer.masksToBounds = YES;
    self.locationTextfield.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.locationTextfield.layer.borderWidth= 2.0f;
    
    self.priceTextfield.layer.masksToBounds = YES;
    self.priceTextfield.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.priceTextfield.layer.borderWidth= 2.0f;
    
    self.searchButtonTapped.layer.masksToBounds = YES;
    self.searchButtonTapped.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.searchButtonTapped.layer.borderWidth= 2.0f;
    
    //set navigation bar to clear
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.barTintColor = [UIColor clearColor];
    
    //hide navigation bar
    self.navigationController.navigationBar.hidden = YES;
    
    
}

- (IBAction)searchButtonTapped:(id)sender {
    
    
    NSLog(@"user entered: %@, %@", self.locationTextfield.text, self.priceTextfield.text);
    
    NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz."] invertedSet];
    NSCharacterSet *invalidCharSett = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    
    NSString *locationEntry = [[self.locationTextfield.text componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
    NSString *priceEntry = [[self.priceTextfield.text componentsSeparatedByCharactersInSet:invalidCharSett] componentsJoinedByString:@""];
    
    [[NSUserDefaults standardUserDefaults] setValue:locationEntry forKey:@"location"];
    [[NSUserDefaults standardUserDefaults] setValue:priceEntry forKey:@"price"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSString *apartmentLocation = _locationTextfield.text;
    NSString *apartmentPrice = _priceTextfield.text;
    
    PFObject *apartment = [PFObject objectWithClassName:@"Entry"];
    apartment[@"apartmentLocation"] = apartmentLocation;
    apartment[@"apartmentPrice"] = apartmentPrice;
    
    [apartment saveInBackgroundWithBlock:^(BOOL succeeded,  NSError *error) {
        if (succeeded == NO) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Your new entry has not been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        
        if (self.locationTextfield && self.priceTextfield == nil) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Please enter a location and price!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
     ];
}

@end
