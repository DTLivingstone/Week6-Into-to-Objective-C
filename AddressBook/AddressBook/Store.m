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

- (NSArray *)allContacts {
    return self.contacts;
}

- (Contact *)contactForIndexPath:(NSIndexPath *)indexPath {
    return self.contacts[indexPath.row];
}

- (NSInteger)count {
    return self.contacts.count;
}

- (void)add:(Contact *)contact {
    if (![self.contacts containsObject:contact]) {
        [self.contacts addObject:contact];
    }
}

- (void)remove:(Contact *)contact {
    if ([self.contacts containsObject:contact]) {
        [self.contacts removeObject:contact];
    }
}

- (void)removeContactAtIndexPath:(NSIndexPath *)indexPath {
    [self remove:[self contactForIndexPath:indexPath]];
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:[NSString archivePath]];
}


@end
