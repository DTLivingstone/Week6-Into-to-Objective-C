//
//  CloudService.h
//  AddressBook
//
//  Created by David Livingstone on 7/15/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CloudKit;
@class Contact;

typedef enum : NSUInteger {
    CloudSave = 0,
    CloudRetrive,
    CloudDelete,
} CloudOperation;

typedef void(^CloudServiceCompletion)(BOOL success, NSArray<Contact *> *contacts);

@interface CloudService : NSObject

+ (instancetype)shared;

- (void)enqueueOperation:(CloudServiceCompletion)completion;
- (void)enqueueOperation:(CloudOperation)operation contact: (Contact *)contact completion:(CloudServiceCompletion)comletion;

@end