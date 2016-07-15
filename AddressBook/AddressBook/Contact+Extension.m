//
//  Contact+Extension.m
//  AddressBook
//
//  Created by David Livingstone on 7/14/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "Contact+Extension.h"
#import "NSString+Extension.h"

@implementation Contact (Extension)

- (BOOL)isValid {
    if (self.first.length > 0 && self.last.length > 0) {
        return YES;
    }
    
    else {
        return NO;
    }
}

+ (void)contactsFromRecords:(NSArray<CKRecord *> *)records completion:(ContactCompletion)completion {
    if (!records || records.count == 0) {
        completion(nil);
    }
    
    else {
        
        [[[NSOperationQueue alloc]init]addOperationWithBlock:^{
            
            NSMutableArray *contacts = [[NSMutableArray alloc]init];
            
            for (CKRecord *record in records) {
                NSString *first = record[@"first"];
                NSString *last = record[@"last"];
                NSString *email = record[@"email"];
                NSString *phone = record[@"phone"];
                NSString *twitter = record[@"twitter"];

                [contacts addObject:[[Contact alloc]initWithFirst:first last:last email:email phone:phone twitter:twitter]];
            }
            
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                completion(contacts);
            }];
        }];
    }
}

@end
