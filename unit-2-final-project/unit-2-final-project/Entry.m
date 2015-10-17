//
//  Entry.m
//  unit-2-final-project
//
//  Created by Lauren Caponong on 10/13/15.
//  Copyright © 2015 Lauren Caponong. All rights reserved.

#import "Entry.h"

@implementation Entry

@dynamic createdAt;
@dynamic descriptionOfEntry;
@dynamic titleOfEntry;
@dynamic dateOfEntry;
@dynamic journalEntries;
@dynamic apartmentLocation;
@dynamic apartmentPrice;


+ (NSString *) parseClassName {
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


@end
