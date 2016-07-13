//
//  main.m
//  AddressBook
//
//  Created by David Livingstone on 7/12/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLUserDefaults.h"
#import "Contact.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [[DLUserDefaults sharedDefaults]setObject:@(sender.isOn) forKey:@"com.michaelbabiy.kUserPreferences"];
        
        Contact *david = [[Contact alloc]init];
        
        [david setName:@"David Livingstone"];
        [david setAddress:@"123 Main Street, Seattle Wa, 98103"];
        [david setPhone:@"575-555-3204" ];
        [david setEmail:@"david@david.tl"];
        [david setTwitter:@"@livingstone86"];
        
        NSLog(@"Name: %@", david.name);
        NSLog(@"Address: %@", david.name);
        NSLog(@"Phone: %@", david.name);
        NSLog(@"Email: %@", david.name);
        NSLog(@"Twitter: %@", david.name);
        
    }
    return 0;
}
