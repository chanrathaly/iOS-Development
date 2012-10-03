//
//  ActionPlanViewController.m
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ActionPlanViewController.h"
#import "ViewController.h"
#import "MenuController.h"
#import "AddActionPlanViewController.h"
#import "ActionPlanDetailViewController.h"
#import "Constant.h"

@interface ActionPlanViewController ()

@end

@implementation ActionPlanViewController

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
    
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=get_action_plan_list&emp_role=%@&emp_id=%@",[arr objectAtIndex:7],[arr objectAtIndex:0]]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    
    if (data != nil) {
        NSError *error = nil;
        action_plans = [[NSArray alloc] init];
        action_plans = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        [actionPlanTableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [action_plans count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    cell = [actionPlanTableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    NSDictionary *action_plan = [action_plans objectAtIndex:indexPath.row];

    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [[cell textLabel] setText:[action_plan objectForKey:@"ap_title"]];
    [[cell textLabel] setTextColor:[UIColor blackColor]];
    [[cell detailTextLabel] setText:[action_plan objectForKey:@"email"]];
    [[cell detailTextLabel] setTextColor:[UIColor grayColor]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActionPlanDetailViewController *apDetail = [[ActionPlanDetailViewController alloc] initWithNibName:nil bundle:nil];
    apDetail.selectedAp = [action_plans objectAtIndex:indexPath.row];
    [self presentModalViewController:apDetail animated:YES];
}

- (void)viewDidUnload
{
    actionPlanTableView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnAddActionPlan:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[AddActionPlanViewController alloc] init] CurrentView:self];
}

-(IBAction)btnMenu:(id)sender
{
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[MenuController alloc] init] CurrentView:self];
}

@end
