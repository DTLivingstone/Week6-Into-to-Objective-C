//
//  Contact.h
//  AddressBook
//
//  Created by David Livingstone on 7/12/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

{
    NSString *_name;
    NSString *_address;
    NSString *_phone;
    NSString *_email;
    NSString *_twitter;
}

-(void)setName:(NSString *)name;
-(NSString *)name;

-(void)setAddress:(NSString *)address;
-(NSString *)address;

-(void)setPhone:(NSString *)phone;
-(NSString *)phone;

-(void)setEmail:(NSString *)email;
-(NSString *)email;

-(void)setTwitter:(NSString *)twitter;
-(NSString *)twitter;

@end
