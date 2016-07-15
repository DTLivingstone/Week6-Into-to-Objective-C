//
//  Store.m
//  AddressBook
//
//  Created by David Livingstone on 7/14/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "Store.h"
#import "Contact.h"
#import "NSString+Extension.h"
#import "CloudService.h"

@interface Store ()

@property (copy, nonatomic) NSMutableArray *contacts;

@end

@implementation Store

+ (instancetype)shared {
    static Store *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    
    return shared;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _contacts = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:[NSString archivePath]]];
        
        if (!_contacts) {
            _contacts = [[NSMutableArray alloc]init];
        }
    }
    
    return self;
}

- (void)addContactsFromCloudKit:(NSArray *)contacts
{
    if (contacts.count == 0) {
        self.contacts = [[NSMutableArray alloc]initWithArray:contacts];
    }
    
    else {
        for (Contact *contact in contacts) {
            NSString *email = contact.email;
            BOOL found = NO;
            
            for (Contact *localContact in self.contacts) {
                if ([email compare:localContact.email] == NSOrderedSame) {
                    found = YES;
                    break;
                }
            }
            
            if (!found) {
                [self.contacts addObject:contacts];
            }
        }
    }
}

- (NSArray *)allContacts {
    return self.contacts;
}

- (Contact *)contactForIndexPath:(NSIndexPath *)indexPath {
    return self.contacts[indexPath.row];
}

- (NSInteger)count {
    return self.contacts.count;
}

//- (void)add:(Contact *)contact {
//    if (![self.contacts containsObject:contact]) {
//        [self.contacts addObject:contact];
//    }
//}
//
//- (void)remove:(Contact *)contact {
//    if ([self.contacts containsObject:contact]) {
//        [self.contacts removeObject:contact];
//    }
//}
//
//- (void)removeContactAtIndexPath:(NSIndexPath *)indexPath {
//    [self remove:[self contactForIndexPath:indexPath]];
//}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:[NSString archivePath]];
}

- (void)add:(Contact *)contact completion:(StoreCompletion)completion
{
    if (![self.contacts containsObject:contact]) {
        [[CloudService shared]enqueueOperation:CloudSave contact:contact completion:^(BOOL success, NSArray<Contact *> *contacts) {
            if (success) {
                [self.contacts addObject:contact];
                [self save];
                
                completion();
            }
        }];
    }
}

- (void)remove:(Contact *)contact completion:(StoreCompletion)completion
{
    if ([self.contacts containsObject:contact]) {
        [[CloudService shared]enqueueOperation:CloudDelete contact:contact completion:^(BOOL success, NSArray<Contact *> *contacts) {
            if (success) {
                [self.contacts removeObject:contact];
                [self save];
                
                completion();
            }
        }];
    }
}

- (void)removeContactAtIndexPath:(NSIndexPath *)indexPath completion:(StoreCompletion)completion
{
    [self remove:[self contactForIndexPath:indexPath] completion:completion];
}


@end
