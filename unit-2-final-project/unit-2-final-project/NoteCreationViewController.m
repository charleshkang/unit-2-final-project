//
//  NoteCreationViewController.m
//  dig.it
//
//  Created by Lauren Caponong on 10/22/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "NoteCreationViewController.h"

@interface NoteCreationViewController ()


@end

@implementation NoteCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //change title of navigation bar
    self.navigationItem.title = @"add note";
    
   }

- (IBAction)saveButtonTapped:(id)sender {
    
    // hide the keyboard
    [self.titleNoteTextField resignFirstResponder];
    [self.noteDescriptionTextField resignFirstResponder];
    
    // create strings to store text info
    NSString *noteTitle = [self.titleNoteTextField text];
    NSString *noteDescription = [self.noteDescriptionTextField text];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // store the data
    [defaults setObject:noteTitle forKey:@"title"];
    [defaults setObject:noteDescription forKey:@"description"];
    
    [defaults synchronize];
    
    NSLog(@"entry saved, title: %@, description: %@", noteTitle, noteDescription);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
