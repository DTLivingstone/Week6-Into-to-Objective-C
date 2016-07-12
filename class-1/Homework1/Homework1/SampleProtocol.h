//
//  SampleProtocol.h
//  Homework1
//
//  Created by David Livingstone on 7/12/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SampleProtocol <NSObject>

-(void) assets;
-(void) expesnses;

@optional

-(void) capitalGains;
-(void) dividends;

@end