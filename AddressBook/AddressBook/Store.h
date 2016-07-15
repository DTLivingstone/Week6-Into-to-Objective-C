//
//  Store.h
//  AddressBook
//
//  Created by David Livingstone on 7/14/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

@import UIKit;
@class Contact;

@interface Store : NSObject

+ (instancetype)shared;

- (NSArray *)allContacts;
- (Contact *)contactForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)count;

- (void)add:(Contact *)contact;
- (void)remove:(Contact *)contact;
- (void)removeContactAtIndexPath:(NSIndexPath *)indexPath;
- (void)save;

@end