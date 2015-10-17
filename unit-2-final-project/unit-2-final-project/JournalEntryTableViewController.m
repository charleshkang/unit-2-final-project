//
//  JournalEntryTableViewController.m
//  unit-2-final-project
//
//  Created by Charles Kang on 10/16/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "JournalEntryTableViewController.h"
#import "Entry.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@implementation JournalEntryTableViewController

+(NSString *)parseClassName{
    
    return @"Entry";
}

- (void) viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Journal Entries";

    [Entry fetchAll:^(NSArray *results, NSError *error) {
        
        self.entry.journalEntries = [NSMutableArray arrayWithArray:results];
        
        [self.tableView reloadData];
        
    }];
}

+(void)fetchAll:(void (^)(NSArray *, NSError *))completion{
    
    //create query
    PFQuery *query = [PFQuery queryWithClassName:[self parseClassName]];
    
    //find all objects and return them in an array
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        completion(objects, error);
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //return count of API results array
    // commented this out b/c code is breaking, trying to figure out what's up -charles
    
    return self.entry.journalEntries.count;
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"journalCellIdentifier" forIndexPath:indexPath];
    
    
    // commented this out b/c code is breaking, trying to figure out what's up -charles
    //    cell.textLabel.text = self.entry.journalEntries[indexPath.row][@"Entry"];
    //    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", self.apartmentPrice.journalEntries[indexPath.row][@"createdAt"]];
    
    return cell;
}


- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"back tapped");
}
@end



