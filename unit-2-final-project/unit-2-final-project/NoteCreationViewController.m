//
//  NoteCreationViewController.m
//  dig.it
//
//  Created by Lauren Caponong on 10/22/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "NoteCreationViewController.h"
#import <Parse/Parse.h>
#import "Entry.h"

@interface NoteCreationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *entryTextField;


@end

@implementation NoteCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //change title of navigation bar
    self.navigationItem.title = @"add note";
    
   }

- (IBAction)doneButtonTapped:(id)sender {
    
    PFObject *entry = [PFObject objectWithClassName:@"Entry"];
    [entry setObject:self.titleTextField.text forKey:@"title"];
    [entry setObject:self.entryTextField.text forKey:@"entry"];
 
    NSLog(@"USER JOURNAL: %@, %@", self.titleTextField.text, self.entryTextField.text);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    [entry saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (!error) {
            // Show success message
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Complete" message:@"Successfully saved the note - please refresh." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            // Notify table view to reload the recipes from Parse cloud
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshTable" object:self];
            
            // Dismiss the controller
            [self dismissViewControllerAnimated:YES completion:nil];
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Failure" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        
    }];
}

//- (IBAction)saveButtonTapped:(id)sender {
//    
//    // hide the keyboard
//    [self.titleNoteTextField resignFirstResponder];
//    [self.noteDescriptionTextField resignFirstResponder];
//    
//    // create strings to store text info
//    NSString *noteTitle = [self.titleNoteTextField text];
//    NSString *noteDescription = [self.noteDescriptionTextField text];
//    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    // store the data
//    [defaults setObject:noteTitle forKey:@"title"];
//    [defaults setObject:noteDescription forKey:@"description"];
//    
//    [defaults synchronize];
//    
//    NSLog(@"entry saved, title: %@, description: %@", noteTitle, noteDescription);
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
//    
//    
//    
//}
//
//- (IBAction)cancelButtonTapped:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
@end
