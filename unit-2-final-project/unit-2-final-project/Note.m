//
//  Note.m
//  dig.it
//
//  Created by Chris David on 10/20/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "Note.h"

@implementation Note

@dynamic text;
@dynamic timestamp;
@dynamic empty;

- (void)awakeFromInsert
{
    [super awakeFromInsert];
    
    self.timestamp = [NSDate date];
}

- (BOOL)isEmpty
{
    return [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0;
}

@end
