//
//  DLUserDefaults.m
//  AddressBook
//
//  Created by David Livingstone on 7/12/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "DLUserDefaults.h"

@interface DLUserDefaults()

@property (strong, nonatomic) NSMutableDictionary *preferences;

@end

@implementation DLUserDefaults

+ (instancetype)sharedDefaults {
    static DLUserDefaults *sharedDefaults = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDefaults = [[[self class]alloc]init];
    });
    return sharedDefaults;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _preferences = [self setupPreferences];
    }
    
    return self;
}

- (NSMutableDictionary *)setupPreferences {
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfURL:[self preferencesURL]];
    
    if (jsonData) {
        NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if (!error && json) {
            return json;
        }
    }
    
    return [[NSMutableDictionary alloc]init];
}

- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key {
    [self.preferences setObject:object forKey:key];
    
    [self sync];
}

- (nullable id)objectForKey:(nonnull NSString *)key {
    return [self.preferences objectForKey:key];
}

- (void)sync {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.preferences options:NSJSONWritingPrettyPrinted error:&error];
    if (!error && jsonData) {
        if ([jsonData writeToFile:[[self preferencesURL]path] atomically:YES]) {
//            [[NSNotificationCenter defaultCenter]postNotificationName:kDLUserDefaultsDidUpdate object:nil];
        }
    }
}

- (void)erase {
    [[NSFileManager defaultManager]removeItemAtURL:[self preferencesURL] error:nil];
    [self.preferences removeAllObjects];
    
    [self sync];
}

#pragma mark - helper functions

- (NSURL *)documentsDirectory {
    return[[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];
}

- (NSURL *)preferencesURL {
    return[[self documentsDirectory]URLByAppendingPathComponent:@"preferencesJSON"];
}

@end
