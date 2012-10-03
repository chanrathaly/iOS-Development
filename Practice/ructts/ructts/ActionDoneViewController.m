//
//  ActionDoneViewController.m
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ActionDoneViewController.h"
#import "ViewController.h"
#import "MenuController.h"
#import "AddActionDoneViewController.h"
#import "ActionDoneDetailViewController.h"
#import "Constant.h"

@interface ActionDoneViewController ()

@end

@implementation ActionDoneViewController

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
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=get_action_done_list&emp_role=%@&emp_id=%@",[arr objectAtIndex:7],[arr objectAtIndex:0]]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    
    if (data != nil) {
        NSError *error = nil;
        action_dones = [[NSArray alloc] init];
        action_dones = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        [actionDoneTableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [action_dones count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    cell = [actionDoneTableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    NSDictionary *action_done = [action_dones objectAtIndex:indexPath.row];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [[cell textLabel] setText:[action_done objectForKey:@"ad_title"]];
    [[cell textLabel] setTextColor:[UIColor blackColor]];
    [[cell detailTextLabel] setText:[action_done objectForKey:@"email"]];
    [[cell detailTextLabel] setTextColor:[UIColor grayColor]];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActionDoneDetailViewController *adDetail = [[ActionDoneDetailViewController alloc] initWithNibName:nil bundle:nil];
    adDetail.selectedAd = [action_dones objectAtIndex:indexPath.row];
    [self presentModalViewController:adDetail animated:YES];
}

- (void)viewDidUnload
{
    actionDoneTableView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnAddAction:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[AddActionDoneViewController alloc] init] CurrentView:self];
}

-(IBAction)btnMenu:(id)sender
{
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[MenuController alloc] init] CurrentView:self];
}

@end
