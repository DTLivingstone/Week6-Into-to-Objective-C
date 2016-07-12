//
//  AppDelegate.m
//  Homework1
//
//  Created by David Livingstone on 7/11/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "AppDelegate.h"
#import "StringToWordsArray.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (id)problemTwo:(id)input {
    if ([input isKindOfClass:[NSNumber class]]) {
        double inputInt = [input intValue];
        
        NSLog(@"%@", [[NSNumber alloc] initWithDouble:sqrt(inputInt)]);
    }
    else if ([input isKindOfClass:[NSString class]]) {
        NSMutableString *reversedString = [NSMutableString string];
        NSInteger i = [input length];
        
        while (i > 0) {
            i -= 1;
            NSString *letter = [input substringWithRange:NSMakeRange(i, 1)];
            [reversedString appendString:letter];
        }
        
        NSLog(@"%@", reversedString);
    }
    else if ([input isKindOfClass:[NSArray class]]) {
        
        NSInteger stringCount = 0;
        NSInteger numCount = 0;
        
        for (NSUInteger index = 0; index < [input count]; index++) {
            if ([[input objectAtIndex: index] isKindOfClass:[NSString class]]) {
                stringCount += 1;
            }
            else if ([[input objectAtIndex: index] isKindOfClass:[NSNumber class]]) {
                numCount += 1;
            }
        }
        
        NSLog(@"Strings: %ld \n Numbers: %ld", stringCount, numCount);
    }
    return nil;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Problem 1
    NSString *input = @"a b c d e f g";
    NSArray *arrayOfWords = [NSString toWords: input];
    NSLog(@"%@", arrayOfWords);
    
    // Problem 2
    NSNumber *problemTwoNumber = [NSNumber numberWithInteger:7];
    NSString *problemTwoString = @"Tacocat is the best band!";
    NSArray *problemTwoArray = @[@1, @2, @3, @"git", @"hub"];
    
    [self problemTwo:problemTwoNumber];
    [self problemTwo:problemTwoString];
    [self problemTwo:problemTwoArray];
    
    // Problem 3
    
    
    
    return YES;
}

@end
