//
//  AppDelegate.m
//  ClassMates
//
//  Created by Michael Babiy on 1/19/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import "AppDelegate.h"
#import "Store.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [[Store shared]save];
}

@end
