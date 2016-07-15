//
//  AddContactViewController.h
//  AddressBook
//
//  Created by David Livingstone on 7/13/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddContactViewControllerCompletion)();

@interface AddContactViewController : UIViewController

//- (void)showAlertView;

@property (copy, nonatomic) AddContactViewControllerCompletion completion;

+ (NSString *)identifier;

@end