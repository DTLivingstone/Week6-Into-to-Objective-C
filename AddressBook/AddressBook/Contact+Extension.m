//
//  Contact+Extension.m
//  AddressBook
//
//  Created by David Livingstone on 7/14/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "Contact+Extension.h"
#import "NSString+Extension.h"

@implementation Contact (Extension)

- (BOOL)isValid {
    if (self.first.length > 0 && self.last.length > 0) {
        return YES;
    }
    
    else {
        return NO;
    }
}

@end
