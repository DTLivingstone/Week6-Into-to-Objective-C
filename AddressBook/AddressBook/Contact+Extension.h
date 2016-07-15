//
//  Contact+Extension.h
//  AddressBook
//
//  Created by David Livingstone on 7/14/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "Contact.h"
@import CloudKit;

typedef void(^ContactCompletion)(NSArray<Contact *> *contacts);

@interface Contact (Extension)

+ (void)contactsFromRecords:(NSArray<CKRecord *> *)records completion:(ContactCompletion)completion;

- (BOOL)isValid;

@end