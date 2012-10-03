//
//  MenuController.m
//  ructts
//
//  Created by apple on 9/20/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "EmployeeController.h"
#import "Constant.h"
#import "EmployeeDetailController.h"
#import "AddEmployeeController.h"
#import "ViewController.h"
#import "MenuController.h"

@interface EmployeeController ()

@end

@implementation EmployeeController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=get_employee_list"]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];

    if (data != nil) {
        NSError *error = nil;
        employees = [[NSArray alloc] init];
        employees = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        allEmps = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        displayEmps = [[NSMutableArray alloc] init];
        for (NSDictionary *emp in allEmps) {
            [displayEmps addObject:[emp objectForKey:@"email"]];
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardWillHideNotification object:nil];
        
        [employeeTableView reloadData];
    }
}

-(void)keyboardShown:(NSNotification *)note {
    CGRect keyboardFrame;
    [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
    CGRect tableViewFrame = employeeTableView.frame;
    tableViewFrame.size.height -= keyboardFrame.size.height;
    [employeeTableView setFrame:tableViewFrame];
}

-(void)keyboardHidden:(NSNotification *)note {
    [employeeTableView setFrame:self.view.bounds];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [employees count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    cell = [employeeTableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    NSDictionary *emp = [employees objectAtIndex:indexPath.row];

    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    [[cell textLabel] setText:[emp objectForKey:@"email"]];
    [[cell textLabel] setTextColor:[UIColor blackColor]];
    [[cell detailTextLabel] setText:[emp objectForKey:@"role"]];
    [[cell detailTextLabel] setTextColor:[UIColor blackColor]];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EmployeeDetailController *empDetail = [[EmployeeDetailController alloc] initWithNibName:nil bundle:nil];
    empDetail.selectedEmp = [employees objectAtIndex:indexPath.row];
    [self presentModalViewController:empDetail animated:YES];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText length] == 0) {
        [displayEmps removeAllObjects];
        for (NSDictionary *emp in allEmps) {
            [displayEmps addObject:[emp objectForKey:@"email"]];
        }
    } else {
        [displayEmps removeAllObjects];
        for (NSDictionary *emp in allEmps) {
            NSRange r = [[emp objectForKey:@"email"] rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (r.location != NSNotFound) {
                [displayEmps addObject:[emp objectForKey:@"email"]];
            }
        }
    }
    [employeeTableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar {
    [txtSearchEmp resignFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnNewEmployee:(id)sender {
    AddEmployeeController *addEmployee = [[AddEmployeeController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:addEmployee animated:YES];
}

-(IBAction)btnMenu:(id)sender
{
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[MenuController alloc] init] CurrentView:self];
}
@end
