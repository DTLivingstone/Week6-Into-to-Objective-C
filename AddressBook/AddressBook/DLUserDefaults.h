//
//  DLUserDefaults.h
//  AddressBook
//
//  Created by David Livingstone on 7/12/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLUserDefaults : NSObject

+ (nonnull instancetype)sharedDefaults;

- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key;
- (nullable id)objectForKey:(nonnull NSString *)key;

- (void)erase;

@end
