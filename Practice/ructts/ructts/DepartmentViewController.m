//
//  DepartmentViewController.m
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "DepartmentViewController.h"
#import "ViewController.h"
#import "MenuController.h"
#import "Constant.h"
#import "DepDetailViewController.h"
#import "AddDeptViewController.h"

@interface DepartmentViewController ()

@end

@implementation DepartmentViewController

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
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=get_department_list"]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    
    if (data != nil) {
        NSError *error = nil;
        departments = [[NSArray alloc] init];
        departments = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        allDeps = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        displayDepartments = [[NSMutableArray alloc] init];
        for (NSDictionary *dep in allDeps) {
            [displayDepartments addObject:[dep objectForKey:@"dep_name"]];
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardWillHideNotification object:nil];
        
        [depListTableView reloadData];
    }
}

-(void)keyboardShown:(NSNotification *)note {
    CGRect keyboardFrame;
    [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
    CGRect tableViewFrame = depListTableView.frame;
    tableViewFrame.size.height -= keyboardFrame.size.height;
    [depListTableView setFrame:tableViewFrame];
}

-(void)keyboardHidden:(NSNotification *)note {
    [depListTableView setFrame:self.view.bounds];
//    
//    CGRect navigateBarFrame;
//    [[[note userInfo] objectForKey:] getValue:&keyboardFrame];
//    CGRect tableViewFrame = depListTableView.frame;
//    tableViewFrame.size.height -= keyboardFrame.size.height;
//    [depListTableView setFrame:tableViewFrame];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [displayDepartments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    cell = [depListTableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    [[cell textLabel] setText:[displayDepartments objectAtIndex:indexPath.row]];
    [[cell textLabel] setTextColor:[UIColor blackColor]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DepDetailViewController *depDetail = [[DepDetailViewController alloc] initWithNibName:nil bundle:nil];
    depDetail.selectedDep = [departments objectAtIndex:indexPath.row];
    [self presentModalViewController:depDetail animated:YES];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText length] == 0) {
        [displayDepartments removeAllObjects];
        for (NSDictionary *dep in allDeps) {
            [displayDepartments addObject:[dep objectForKey:@"dep_name"]];
        }
    } else {
        [displayDepartments removeAllObjects];
        for (NSDictionary *dep in allDeps) {
            NSRange r = [[dep objectForKey:@"dep_name"] rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (r.location != NSNotFound) {
                [displayDepartments addObject:[dep objectForKey:@"dep_name"]];
            }
        }
    }
    [depListTableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar {
    [txtSearchDep resignFirstResponder];
}

- (void)viewDidUnload
{
    txtSearchDep = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)btnMenu:(id)sender
{
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[MenuController alloc] init] CurrentView:self];
}

- (IBAction)btnAddDep:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[AddDeptViewController alloc] init] CurrentView:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtSearchDep resignFirstResponder];
}
@end
