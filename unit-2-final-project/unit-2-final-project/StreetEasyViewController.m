//
//  WeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Chris David on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//



#import "StreetEasyViewController.h"
#import "SignUpLoginViewController.h"
#import "EntryCreationViewController.h"
#import  "JournalEntryTableViewController.h"
#import "APIManager.h"
#import "ApartmentListingsCell.h"
#import "StreetEasyDetailViewController.h"
#import <AFNetworking/AFNetworking.h>


@interface StreetEasyViewController ()


@property (nonatomic) NSString *price;
@property (nonatomic) NSString *location;
@property (nonatomic) NSMutableArray *apartments;

@end

@implementation StreetEasyViewController


static NSString * const detailSegue = @"showDetail";
static NSString * const locationSegue = @"settingsTab";
static NSString * const apiKey = @"ec69d94dfbb30a7399b00c6a2cc6a544d3cde4ba";
static NSString * const cellIdentifier = @"ApartmentCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.apartments = [[NSMutableArray alloc] init];
    
    [self setupSegueCell];
}

#pragma Mark - NSUser Defaults (Apartment Filters)

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.location = [[NSUserDefaults standardUserDefaults] stringForKey:@"location"];
    self.price = [[NSUserDefaults standardUserDefaults] stringForKey:@"price"];
    
    if (self.location != nil && self.price != nil) {
//        [self fetchData];
    }
}



- (void)setupSegueCell {
    UINib *cellNib = [UINib nibWithNibName:@"ApartmentListingsCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:cellIdentifier];
}

#pragma Mark - API Stuff



- (void)fetchData {
    
    [self.apartments removeAllObjects];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *stringURL = [NSString stringWithFormat:@"http://streeteasy.com/nyc/api/rentals/data?criteria=area:%@|price:%@-%%7C&amp;key=%@&amp;format=json", self.location,self.price, apiKey];
    
    [manager GET:stringURL parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSDictionary *dailyData = responseObject[@"daily"][@"data"];

        
//        for (NSDictionary *day in dailyData) {
//            
//            Weather *dayOfWeek = [[Weather alloc] initWithSecondsSince1970:[day[@"time"] doubleValue]];
//            dayOfWeek.summary = day[@"summary"];
//            dayOfWeek.tempMax = [day[@"temperatureMax"] doubleValue];
//            dayOfWeek.tempMin = [day[@"temperatureMin"] doubleValue];
//            dayOfWeek.iconName = day[@"icon"];
//            dayOfWeek.humidity = [day[@"humidity"] doubleValue];
//            dayOfWeek.windSpeed = [day[@"windSpeed"] doubleValue];
//            
//            [self.days addObject:dayOfWeek];
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
    cell.locationLabel.text = [NSString stringWithFormat:@"%.2f",
                               [self.days[indexPath.row] tempMax]];
    
    cell.priceLabel.text = [NSString stringWithFormat:@"%.2f",
                              [self.days[indexPath.row] tempMin]];
    
    cell.dayLabel.text = [self.days[indexPath.row] dayOfWeek];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:detailSegue sender:self];
}

#pragma mark - Navigation

- (IBAction)didTapLocation:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:locationSegue sender:self];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:detailSegue]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        StreetEasyDetailViewController*vc = [segue destinationViewController];
        
        vc.imageName = [self.days[indexPath.row] iconName];
        vc.humidity = [self.days[indexPath.row] humidity];
        vc.windSpeed = [self.days[indexPath.row] windSpeed];
        vc.summary = [self.days[indexPath.row] summary];
        
    } else if ([segue.identifier isEqualToString:locationSegue]) {
        
    }
}


@end
