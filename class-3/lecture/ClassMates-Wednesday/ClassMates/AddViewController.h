//
//  AddViewController.h
//  ClassMates
//
//  Created by Michael Babiy on 7/13/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddViewControllerCompletion)();

@interface AddViewController : UIViewController

@property (copy, nonatomic) AddViewControllerCompletion completion;

+ (NSString *)identifier;

@end
