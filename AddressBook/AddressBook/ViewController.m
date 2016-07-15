//
//  ViewController.m
//  AddressBook
//
//  Created by David Livingstone on 7/13/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "ViewController.h"
#import "Store.h"
#import "Contact.h"
#import "AddContactViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: [AddContactViewController identifier]]) {
        AddContactViewController *addContactViewController = (AddContactViewController *)segue.destinationViewController;
        addContactViewController.completion = ^ {
            [self.tableView reloadData];
        };
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[Store shared]removeContactAtIndexPath:indexPath];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[Store shared]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *contactCell = [tableView dequeueReusableCellWithIdentifier:@"contactCell" forIndexPath:indexPath];
    
    Contact *contact = [[Store shared]contactForIndexPath:indexPath];
    
    contactCell.textLabel.text = [NSString stringWithFormat:@"%@ %@", contact.first, contact.last];
    contactCell.detailTextLabel.text = [NSString stringWithFormat:@"Phone: %@ Email: %@ Twitter: %@", contact.phone, contact.email, contact.twitter];
    
    return contactCell;
}

@end
