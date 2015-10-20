//
//  NoteListItem.h
//  dig.it
//
//  Created by Chris David on 10/20/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoteListItem : NSObject

@property (nonatomic, readonly) NSString *titleText;
@property (nonatomic, readonly) NSString *subtitleText;

- (instancetype)initWithText:(NSString *)text
                   timestamp: (NSDate *)timestamp;

@end