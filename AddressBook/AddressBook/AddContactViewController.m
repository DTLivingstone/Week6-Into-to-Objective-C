//
//  AddContactViewController.m
//  AddressBook
//
//  Created by David Livingstone on 7/13/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "AddContactViewController.h"
#import "Contact+Extension.h"
#import "Store.h"

@interface AddContactViewController ()

@property (strong, nonatomic) Contact *contact;

@property (weak, nonatomic) IBOutlet UITextField *firstField;
@property (weak, nonatomic) IBOutlet UITextField *lastField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *twitterField;


- (IBAction)saveSelected:(UIButton *)sender;

@end

@implementation AddContactViewController

+ (NSString *)identifier
{
    return NSStringFromClass(self);
}

- (Contact *)contact
{
    if (!_contact) {
        _contact = [[Contact alloc]init];
    }
    
    return _contact;
}

//- (void)showAlertView {
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)saveSelected:(UIButton *)sender {
    self.contact.first = self.firstField.text;
    self.contact.last = self.lastField.text;
    self.contact.email = self.emailField.text;
    self.contact.phone = self.phoneField.text;
    self.contact.twitter = self.twitterField.text;
    
    if (self.contact.isValid) {
        NSLog(@"valid!");
    }
    
    if (self.completion) {
        NSLog(@"completion!");
    }
    
    if (self.contact.isValid && self.completion) {
        [[Store shared]add:self.contact];
//        NSLog([Store shared])
        [self completion]();
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
