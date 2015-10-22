//
//  NoteListViewController.h
//  dig.it
//
//  Created by Chris David on 10/20/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

//@class NoteStore;

@interface NoteListViewController : UITableViewController <UITableViewDelegate> {
    
    NSArray *entriesArray;
}


//@property (nonatomic) NoteStore *store;

@end

