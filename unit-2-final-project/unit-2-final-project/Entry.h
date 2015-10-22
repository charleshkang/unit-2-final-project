//
//  Entry.h
//  unit-2-final-project
//
//  Created by Lauren Caponong on 10/13/15.
//  Copyright © 2015 Lauren Caponong. All rights reserved.
//



#import "PFObject.h"
#import <Parse/Parse.h>

@interface Entry : PFObject <PFSubclassing>

@property (nonatomic) NSDate *createdAt;
@property (nonatomic) NSString *titleOfEntry;
@property (nonatomic) NSString *descriptionOfEntry;
@property (nonatomic) NSString *entry;
@property (nonatomic) NSString *title;

@end





//#import "PFObject.h"
//#import <Parse/Parse.h>
//#import <UIKit/UIKit.h>
//#import "User.h"
//
//
//
//@interface Entry : PFObject <PFSubclassing>
//
//@property (nonatomic) NSDate *createdAt;
//@property (nonatomic) NSDate *dateOfEntry;
//@property (nonatomic) NSString *titleOfEntry;
//@property (nonatomic) NSString *descriptionOfEntry;
//@property (nonatomic) NSString *apartmentLocation;
//@property (nonatomic) NSString *apartmentPrice;
//
//
//@property (nonatomic) NSMutableArray *journalEntries;
//
//
//+ (void)fetchAll:(void (^)(NSArray *results, NSError *error))completion;
//
//+ (NSString *)parseClassName;
//
//
//@end

