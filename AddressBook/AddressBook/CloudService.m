//
//  CloudService.m
//  AddressBook
//
//  Created by David Livingstone on 7/15/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "CloudService.h"
#import "Contact+Extension.h"

static NSString *const ContactRecordType = @"Contact";

@interface CloudService ()

@property (strong, nonatomic) CKContainer *container;
@property (strong, nonatomic) CKDatabase *database;

@end

@implementation CloudService

+ (instancetype)shared {
    static CloudService *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    
    return shared;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _container = [CKContainer defaultContainer];
        _database = [_container privateCloudDatabase];
    }
    
    return self;
}

- (void)enqueueOperation:(CloudServiceCompletion)completion {
    [self retrieve:completion];
}

- (void)enqueueOperation:(CloudOperation)operation contact:(Contact *)contact completion:(CloudServiceCompletion)completion {
    if (operation == CloudSave) { // make this a switch???
        [self save:contact completion:completion];
    }
    
    if (operation == CloudRetrive) {
        [self retrieve:completion];
    }
    
    if (operation == CloudDelete) {
        [self delete:contact completion:completion];
    }
}

#pragma mark - helper methods

- (void)retrieve:(CloudServiceCompletion)completion {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
    CKQuery *query = [[CKQuery alloc]initWithRecordType:ContactRecordType predicate:predicate];
    
    [self.database performQuery:query inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
        [Contact contactsFromRecords:results completion:^(NSArray<Contact *> *contacts) {
            completion(YES, contacts);
        }];
    }];
}

- (void)save:(Contact *)contact completion:(CloudServiceCompletion)completion {
    CKRecord *record = [[CKRecord alloc]initWithRecordType:ContactRecordType];
    record[@"first"] = contact.first;
    record[@"last"] = contact.last;
    record[@"email"] = contact.email;
    record[@"phone"] = contact.phone;
    record[@"twitter"] = contact.twitter;
    
    [self.database saveRecord:record completionHandler:^(CKRecord * _Nullable record, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"error saving to cloudkit: %@", [error localizedDescription]);
        }
        
        if (!error && record) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(YES, @[contact]);
            });
        }
    }];
}

- (void)delete:(Contact *)contact completion:(CloudServiceCompletion)completion
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email == %@", contact.email];
    CKQuery *query = [[CKQuery alloc]initWithRecordType:ContactRecordType predicate:predicate];
    
    [self.database performQuery:query inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
        
        if (results && !error) {
            for (CKRecord *record in results) {
                [self.database deleteRecordWithID:record.recordID completionHandler:^(CKRecordID * _Nullable recordID, NSError * _Nullable error) {
                    if (error) {
                        NSLog(@"error deleting from cloudkit: %@", [error localizedDescription]);
                    }
                    
                    else {
                        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                            completion(YES, @[contact]);
                        }];
                    }
                }];
            }
        }
        
    }];
}


@end
