//
//  Contact.h
//  AddressBook
//
//  Created by David Livingstone on 7/13/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject {
    NSString *_first;
    NSString *_last;
    NSString *_email;
    NSString *_phone;
    NSString *_twitter;
}

#pragma mark - initializer

- (instancetype)initWithFirst:(NSString *)first
                            last:(NSString *)last
                            email:(NSString *)email
                            phone:(NSString *)phone
                            twitter:(NSString *)twitter;

#pragma mark - setters/getters

- (void)setFirst:(NSString *)first;
- (NSString *)first;

- (void)setLast:(NSString *)last;
- (NSString *)last;

- (void)setEmail:(NSString *)email;
- (NSString *)email;

- (void)setPhone:(NSString *)phone;
- (NSString *)phone;

- (void)setTwitter:(NSString *)twitter;
- (NSString *)twitter;

@end
