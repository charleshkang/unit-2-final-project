//
//  JournalEntry.h
//  unit-2-final-project
//
//  Created by Charles Kang on 10/16/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>
#import "EntryCreationViewController.h"
#import "Entry.h"

@interface JournalEntry : PFQueryTableViewController

@property (nonatomic) NSString *apartmentLocation;
@property (nonatomic) NSString *apartmentPrice;
@property (nonatomic) NSDate *createdAt;

+(NSString *)parseClassName;
+ (void)fetchAll:(void (^)(NSArray *results, NSError *error))completion;

@property (nonatomic) Entry *entry;



@end
