//
//  EntriesList+CoreDataProperties.h
//  unit-2-final-project
//
//  Created by Lauren Caponong on 10/11/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EntriesList.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntriesList (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *createdAt;
@property (nullable, nonatomic, retain) NSString *titleOfEntry;

@end

NS_ASSUME_NONNULL_END
