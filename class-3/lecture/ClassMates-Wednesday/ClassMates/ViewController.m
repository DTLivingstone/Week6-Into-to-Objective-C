//
//  ViewController.m
//  ClassMates
//
//  Created by Michael Babiy on 1/19/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import "ViewController.h"
#import "Store.h"
#import "Student.h"
#import "AddViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableVIew;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: [AddViewController identifier]]) {
        AddViewController *addViewController = (AddViewController *)segue.destinationViewController;
        addViewController.completion = ^ {
            [self.tableVIew reloadData];
        };
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[Store shared]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *studentCell = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    
    Student *student = [[Store shared]studentForIndexPath:indexPath];
    studentCell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    studentCell.detailTextLabel.text = [NSString stringWithFormat:@"Phone: %@ Email: %@", student.phone, student.email];
    
    return studentCell;
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[Store shared]removeStudentAtIndexPath:indexPath];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

@end