//
//  JournalEntry.m
//  unit-2-final-project
//
//  Created by Charles Kang on 10/16/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "JournalEntry.h"
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>
#import "Entry.h"

@implementation JournalEntry

@dynamic apartmentLocation;
@dynamic apartmentPrice;
@dynamic createdAt;

+(NSString *)parseClassName{
    
    return @"Entry";
}

+(void)fetchAll:(void (^)(NSArray *, NSError *))completion{
    
    //create query
    PFQuery *query = [PFQuery queryWithClassName:[self parseClassName]];
    
    //find all objects and return them in an array
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        completion(objects, error);
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Journal Entries";
    
    [self.tableView reloadData];
}

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"Entry";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"apartmentLocation";
        self.textKey = @"apartmentPrice";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
    }
    return self;
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    return query;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //return count of API results array
    // commented this out b/c code is breaking, trying to figure out what's up -charles

//    return self.entry.journalEntries.count;
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
