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

@interface EntryCreationViewController () <NSFetchedResultsControllerDelegate>

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



- (IBAction)backButtonTapped:(UIBarButtonItem *)sender {

    [self dismissViewControllerAnimated:YES completion:nil];

}


- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    self.entry.titleOfEntry = self.titleTextField.text;
//    self.entry.dateOfEntry = [NSDate date];
    
    [self.tempSet addObject:self.entry];
    
    self.entry = self.tempSet;
    
    [delegate.managedObjectContext save:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
