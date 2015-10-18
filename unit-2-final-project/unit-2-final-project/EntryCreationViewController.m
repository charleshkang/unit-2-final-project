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
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    self.locationTextfield.layer.masksToBounds = YES;
    self.locationTextfield.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.locationTextfield.layer.borderWidth= 2.0f;
    
    self.priceTextfield.layer.masksToBounds = YES;
    self.priceTextfield.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.priceTextfield.layer.borderWidth= 2.0f;
    
}




- (IBAction)saveJournalEntry:(id)sender {
    
    if ([self.locationTextfield.text isEqualToString:@"Apartment Location"]) {
        [self emptyTextField];
        NSLog(@"apartment error");
        
    } if ([self.priceTextfield.text isEqualToString:@"Apartment Price"]) {
        [self emptyTextField];
        NSLog(@"price error");
        
    }
    
    
    NSString *apartmentLocation = _locationTextfield.text;
    NSString *apartmentPrice = _priceTextfield.text;
    
    PFObject *apartment = [PFObject objectWithClassName:@"Entry"];
    apartment[@"apartmentLocation"] = apartmentLocation;
    apartment[@"apartmentPrice"] = apartmentPrice;
    
    [apartment saveInBackgroundWithBlock:^(BOOL succeeded,  NSError *error) {
        if (succeeded == YES) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your new entry has been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Your new entry has not been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }
     
     ];
};

-(void)emptyTextField {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please add a location and price" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
}

- (IBAction)backButtonTapped:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
