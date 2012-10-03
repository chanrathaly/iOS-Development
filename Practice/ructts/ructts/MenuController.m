//
//  MenuController.m
//  ructts
//
//  Created by apple on 9/21/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "MenuController.h"
#import "ViewController.h"
#import "EmployeeController.h"
#import "DepartmentViewController.h"
#import "TeamViewController.h"
#import "ActionDoneViewController.h"
#import "ActionPlanViewController.h"
#import "ProblemCommentViewController.h"
#import "SuggestionViewController.h"
#import "ReportViewController.h"
#import "EmployeeController.h"

@interface MenuController ()

@end

@implementation MenuController

@synthesize menuItems, menuTableView;

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
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"AuthenticatedUserData.plist"];
    [[NSFileManager defaultManager] fileExistsAtPath:plistPath];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    if ([[arr objectAtIndex:7] isEqualToString:@"Admin"])
    {
        [menuItems addObject:@""];
        menuItems = [[NSMutableArray alloc] initWithObjects:@"Report", @"Department", @"Team", @"Employee", nil];
    }
    else
    {
        NSLog(@"Regular");
        menuItems = [[NSMutableArray alloc] init];
    }
    [menuItems addObjectsFromArray:[[NSArray alloc] initWithObjects:@"Action Done", @"Action Plan", @"Problem and Comment", @"Suggestion", nil]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *uniquIdentifier = @"UITableViewCell";
    UITableViewCell *cell = nil;
    cell = [self.menuTableView dequeueReusableCellWithIdentifier:uniquIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:uniquIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;// UITableViewCellAccessoryDetailDisclosureButton;

    [[cell textLabel] setText:[self.menuItems objectAtIndex:indexPath.row]];
    [[cell textLabel] setTextColor:[UIColor blackColor]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedMenu = [[NSString alloc] initWithFormat:@"%@",[self.menuItems objectAtIndex:indexPath.row]];
    
    if ([selectedMenu isEqualToString:@"Report"])
    {
        ViewController *mainView = [[ViewController alloc] init];
        [mainView switchUIView:[[ReportViewController alloc] init] CurrentView:self];
    }
    else if ([selectedMenu isEqualToString:@"Department"])
    {
        ViewController *mainView = [[ViewController alloc] init];
        [mainView switchUIView:[[DepartmentViewController alloc] init] CurrentView:self];
    }
    else if ([selectedMenu isEqualToString:@"Team"])
    {
        ViewController *mainView = [[ViewController alloc] init];
        [mainView switchUIView:[[TeamViewController alloc] init] CurrentView:self];
    }
    else if ([selectedMenu isEqualToString:@"Employee"])
    {
        ViewController *mainView = [[ViewController alloc] init];
        [mainView switchUIView:[[EmployeeController alloc] init] CurrentView:self];
    }
    else if ([selectedMenu isEqualToString:@"Action Done"])
    {
        ViewController *mainView = [[ViewController alloc] init];
        [mainView switchUIView:[[ActionDoneViewController alloc] init] CurrentView:self];
    }
    else if ([selectedMenu isEqualToString:@"Action Plan"])
    {
        ViewController *mainView = [[ViewController alloc] init];
        [mainView switchUIView:[[ActionPlanViewController alloc] init] CurrentView:self];
    }
    else if ([selectedMenu isEqualToString:@"Problem and Comment"])
    {
        ViewController *mainView = [[ViewController alloc] init];
        [mainView switchUIView:[[ProblemCommentViewController alloc] init] CurrentView:self];
    }
    else if ([selectedMenu isEqualToString:@"Suggestion"])
    {
        ViewController *mainView = [[ViewController alloc] init];
        [mainView switchUIView:[[SuggestionViewController alloc] init] CurrentView:self];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
