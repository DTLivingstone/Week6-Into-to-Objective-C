//
//  Contact.m
//  AddressBook
//
//  Created by David Livingstone on 7/12/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "Contact.h"

@implementation Contact

#pragma mark - setters and getters

-(void)setName:(NSString *)name {
    
    if(_name != name){
        [name retain];
        [_name release];
        
        _name = name;
    }
}

-(NSString *)name {
    return _name;
}

-(void)setAddress:(NSString *)address {
    
    if(_address != address){
        [address retain];
        [_address release];
        
        _address = address;
    }
}

-(NSString *)address {
    return _address;
}

-(void)setPhone:(NSString *)phone {
    
    if(_phone != phone){
        [phone retain];
        [_phone release];
        
        _phone = phone;
    }
}

-(NSString *)phone {
    return _phone;
}




@end
