//
//  Store.h
//  AddressBook
//
//  Created by David Livingstone on 7/14/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

@import UIKit;
@class Contact;

typedef void(^StoreCompletion)();

@interface Store : NSObject

+ (instancetype)shared;

- (NSArray *)allContacts;
- (Contact *)contactForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)count;
- (void)addContactsFromCloudKit:(NSArray *)contacts;

- (void)add:(Contact *)contact completion:(StoreCompletion)completion;
- (void)remove:(Contact *)contact completion:(StoreCompletion)completion;
- (void)removeContactAtIndexPath:(NSIndexPath *)indexPath completion:(StoreCompletion)completion;
- (void)save;

@end