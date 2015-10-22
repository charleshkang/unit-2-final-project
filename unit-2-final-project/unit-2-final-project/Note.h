//
//  Note.h
//  dig.it
//
//  Created by Chris David on 10/20/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Note : NSManagedObject

@property (nonatomic) NSString *text;
@property (nonatomic) NSDate *timestamp;

@property (nonatomic, readonly, getter=isEmpty) BOOL empty;

@end


//
//#import "PFObject.h"
//#import <Parse/Parse.h>
//
//@interface Entry : PFObject <PFSubclassing>
//
//@property (nonatomic) NSDate *createdAt;
//@property (nonatomic) NSString *titleOfEntry;
//@property (nonatomic) NSString *descriptionOfEntry;
//
//@end
