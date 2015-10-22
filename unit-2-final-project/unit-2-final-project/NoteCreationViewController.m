//
//  NoteCreationViewController.m
//  dig.it
//
//  Created by Lauren Caponong on 10/22/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "NoteCreationViewController.h"

@interface NoteCreationViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButtonTapped;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButtonTapped;
@property (weak, nonatomic) IBOutlet UITextField *titleNoteTextField;
@property (weak, nonatomic) IBOutlet UITextField *noteDescriptionTextField;


@end

@implementation NoteCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //change title of navigation bar
    self.navigationItem.title = @"add note";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonTapped:(id)sender {
    
    //dismiss modal popup if cancel is clicked
    [self dismissModalViewControllerAnimated:YES];
    
}


- (IBAction)saveButtonTapped:(id)sender {
}

@end
