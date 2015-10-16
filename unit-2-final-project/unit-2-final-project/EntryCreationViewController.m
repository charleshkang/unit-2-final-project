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


@interface EntryCreationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (nonatomic) Entry *entry;
@property (nonatomic) NSMutableOrderedSet *tempSet;

@end

@implementation EntryCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tempSet = [self.entry mutableCopy];
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    self.entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:delegate.managedObjectContext];
    
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
