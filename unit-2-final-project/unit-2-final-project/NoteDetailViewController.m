//
//  NoteDetailViewController.m
//  dig.it
//
//  Created by Chris David on 10/20/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "NoteDetailViewController.h"
#import "Note.h"

@interface NoteDetailViewController () <UITextViewDelegate>

@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation NoteDetailViewController

#pragma mark -
#pragma mark View controller methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textView.text = self.note.text;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.note.text.length == 0) {
        [self.textView becomeFirstResponder];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self saveNoteText];
}

#pragma mark -
#pragma mark Text view methods

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed:)];
    [self.navigationItem setRightBarButtonItem:doneButtonItem animated:YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}

#pragma mark -
#pragma mark Interface actions

- (IBAction)doneButtonPressed:(id)sender
{
    [self.view endEditing:YES];
    
    [self saveNoteText];
}

#pragma mark -
#pragma mark Helpers

- (void)saveNoteText
{
    self.note.text = self.textView.text;
    self.note.timestamp = [NSDate date];
}

@end
