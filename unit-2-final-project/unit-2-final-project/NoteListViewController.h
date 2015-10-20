//
//  NoteListViewController.h
//  dig.it
//
//  Created by Chris David on 10/20/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NoteStore;

@interface NoteListViewController : UITableViewController

@property (nonatomic) NoteStore *store;

@end

