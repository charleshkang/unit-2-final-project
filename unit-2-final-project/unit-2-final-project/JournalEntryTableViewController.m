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
#import "SignUpLoginViewController.h"
#import  "JournalEntryTableViewController.h"
#import "APIManager.h"
#import "ApartmentListingsCell.h"
#import "StreetEasyDetailViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "Apartment.h"
@interface JournalEntryTableViewController ()

@property (nonatomic) NSString *price;
@property (nonatomic) NSString *location;
@property (nonatomic) NSMutableArray *apartments;

@end

@implementation JournalEntryTableViewController
static NSString * const detailSegue = @"showDetail";
static NSString * const locationSegue = @"settingsTab";
static NSString * const apiKey = @"ec69d94dfbb30a7399b00c6a2cc6a544d3cde4ba";
static NSString * const cellIdentifier = @"ApartmentCell";

- (void) viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Dig It";

    self.apartments = [[NSMutableArray alloc] init];
    [self setupSegueCell];
}
#pragma Mark - NSUser Defaults (Apartment Filters)

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.location = [[NSUserDefaults standardUserDefaults] stringForKey:@"location"];
    self.price = [[NSUserDefaults standardUserDefaults] stringForKey:@"price"];
    
    if (self.location != nil && self.price != nil) {
                [self fetchData];
    }
}

- (void)setupSegueCell {
    UINib *cellNib = [UINib nibWithNibName:@"ApartmentListingsCells" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:cellIdentifier];
}



#pragma Mark - API Stuff



- (void)fetchData {
    
    [self.apartments removeAllObjects];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *stringURL = [NSString stringWithFormat:@"http://streeteasy.com/nyc/api/rentals/search?criteria=area:%@%%7Cprice:%@-%%7C&amp;key=%@&amp;format=json", self.location,self.price, apiKey];
   
    
    [manager GET:stringURL parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        //NSDictionary *apartmentData = responseObject[@"listings"][@"rental"];
        NSArray *apartmentData = responseObject
        [@"listings"][@"object"];

       NSLog(@"%@", apartmentData);
        
        for (NSDictionary *apartment in apartmentData) {
            
            Apartment *apartmentForRent = [[Apartment alloc] init];
            apartmentForRent.address = apartment[@"addr_street"];
            apartmentForRent.unit = apartment[@"addr_unit"];
            apartmentForRent.apartmentPrice = [apartment[@"price"] doubleValue];
            apartmentForRent.iconName = apartment[@"medium_image_uri"];
            
            
            [self.apartments addObject:apartmentData];
            
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
#pragma mark - TableView Data;


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apartments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ApartmentListingsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.apartmentImage.image = [UIImage imageNamed:[self.apartments[indexPath.row] iconName]];
    cell.locationLabel.text = [NSString stringWithFormat:@"%@",
                               [self.apartments[indexPath.row] address]];
    
    //    cell.priceLabel.text = [NSString stringWithFormat:@"%@",
    //                              [self.apartments[indexPath.row] apartmentPrice]];
    //
    //
    
    return cell;
}



- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"back tapped");
}
@end


