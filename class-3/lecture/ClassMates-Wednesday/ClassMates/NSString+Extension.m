//
//  NSString+Extension.m
//  ClassMates
//
//  Created by Michael Babiy on 7/13/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (NSString *)archivePath
{
    NSArray *documentsDirectories = [[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentsDirectory = [documentsDirectories firstObject];
    
    return [[documentsDirectory URLByAppendingPathComponent:@"store"]path];
}

- (BOOL)isValidEmail
{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"] evaluateWithObject:self];
}

@end
