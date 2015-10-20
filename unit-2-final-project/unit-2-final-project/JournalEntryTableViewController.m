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
    self.navigationController.navigationBar.hidden = NO;
    
    

    
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
    
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 44.0;
    
    UINib *cellNib = [UINib nibWithNibName:@"ApartmentListingCells" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:cellIdentifier];
}



#pragma Mark - API Stuff



- (void)fetchData {
    
    [self.apartments removeAllObjects];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *stringURL = [NSString stringWithFormat:@"http://streeteasy.com/nyc/api/rentals/search?criteria=area:%@%%7Cprice:%@-%%7C&amp;key=%@&amp;format=json", self.location,self.price, apiKey];
    
    
    [manager GET:stringURL parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSArray *apartmentData = responseObject
        [@"listings"][@"object"];
        
        for (NSDictionary *apartment in apartmentData) {
            NSDictionary * allApartmentData = apartment[@"rental"];
            
            Apartment *apartmentForRent = [[Apartment alloc] init];
            
            apartmentForRent.address = [allApartmentData objectForKey:@"addr_street"];
            apartmentForRent.unit = [allApartmentData objectForKey:@"addr_unit"];
            apartmentForRent.iconName = [allApartmentData objectForKey:@"medium_image_uri"];
            apartmentForRent.apartmentPrice = [[allApartmentData objectForKey:@"price"] integerValue];
            apartmentForRent.apartmentDescription = [allApartmentData objectForKey:@"description"];

            [self.apartments addObject:apartmentForRent];
         
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ApartmentListingsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    Apartment *apartment = self.apartments[indexPath.row];
    
    NSURL *url = [NSURL URLWithString:apartment.iconName];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.apartmentImage.image = [UIImage imageWithData:data];
    
   
    
    cell.locationLabel.text = [NSString stringWithFormat:@"%@",
                               apartment.address];
    cell.apartmentNumber.text = [NSString stringWithFormat:@"Unit: %@",apartment.unit];
    cell.priceLabel.text = [NSString stringWithFormat:@"Price: $%ld", (long)apartment.apartmentPrice];
    
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:detailSegue sender:self];
}

- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        StreetEasyDetailViewController*vc = [segue destinationViewController];
        
        
    
    Apartment *apartment = self.apartments[indexPath.row];
        
        
        
        vc.apartmentImage = apartment.iconName;
  
        vc.apartmentAddress = apartment.address;
        vc.apartmentUnit = apartment.unit;
       //vc.apartmentCost = apartment.apartmentPrice;
     vc.apartmentDescription = apartment.apartmentDescription;
    
//        vc.windSpeed = [self.days[indexPath.row] windSpeed];
//        vc.summary = [self.days[indexPath.row] summary];
        
    
}

@end



