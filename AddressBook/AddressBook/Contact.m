//
//  Contact.m
//  AddressBook
//
//  Created by David Livingstone on 7/13/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "Contact.h"

@interface Contact () <NSCoding>

@end

@implementation Contact

- (instancetype)initWithFirst:(NSString *)first
                            last:(NSString *)last
                            email:(NSString *)email
                            phone:(NSString *)phone
                            twitter:(NSString *)twitter
{
    self = [super init];
    
    if (self) {
        _first = first;
        _last = last;
        _email = email;
        _phone = phone;
        _twitter = twitter;
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithFirst:@"" last:@"" email:@"" phone:@"" twitter:@""];
}

#pragma mark - setters/getters

// first name
- (void)setFirst:(NSString *)first {
    if (_first != first) {
        _first = [first copy];
    }
}

- (NSString *)first {
    return _first;
}

// last name
- (void)setLast:(NSString *)last {
    if (_last != last) {
        _last = [last copy];
    }
}

- (NSString *)last {
    return _last;
}

// email
- (void)setEmail:(NSString *)email {
    if (_email != email) {
        _email = [email copy];
    }
}

- (NSString *)email {
    return _email;
}

// email
- (void)setPhone:(NSString *)phone {
    if (_phone != phone) {
        _phone = [phone copy];
    }
}

- (NSString *)phone {
    return _phone;
}

// twitter
- (void)setTwitter:(NSString *)twitter {
    if (_twitter != twitter) {
        _twitter = [twitter copy];
    }
}

- (NSString *)twitter {
    return _twitter;
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSString *first = [aDecoder decodeObjectForKey:@"first"];
    NSString *last = [aDecoder decodeObjectForKey:@"last"];
    NSString *email = [aDecoder decodeObjectForKey:@"email"];
    NSString *phone = [aDecoder decodeObjectForKey:@"phone"];
    NSString *twitter = [aDecoder decodeObjectForKey:@"twitter"];
    
    return [self initWithFirst:first last:last email:email phone:phone twitter:twitter];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.first forKey:@"first"];
    [aCoder encodeObject:self.last forKey:@"last"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
}

@end
