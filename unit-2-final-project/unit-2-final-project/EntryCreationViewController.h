//
//  EntryCreationViewController.h
//  unit-2-final-project
//
//  Created by Lauren Caponong on 10/11/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EntryCreationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *locationTextfield;
@property (weak, nonatomic) IBOutlet UITextField *priceTextfield;
@property (weak, nonatomic) IBOutlet UIButton *searchButtonTapped;



@end
