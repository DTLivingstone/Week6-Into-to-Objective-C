//
//  StringToWords.m
//  Homework1
//
//  Created by David Livingstone on 7/11/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "StringToWordsArray.h"

@implementation NSString (StringToWordsArray)

+(NSArray *) toWords: (NSString *) input;

{
    NSArray *result = [input componentsSeparatedByString:@" "];
    return result;
}

@end