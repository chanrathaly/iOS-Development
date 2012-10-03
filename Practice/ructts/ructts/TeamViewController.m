//
//  TeamViewController.m
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "TeamViewController.h"
#import "ViewController.h"
#import "MenuController.h"
#import "Constant.h"
#import "TeamDetailViewController.h"
#import "AddTeamViewController.h"

@interface TeamViewController ()

@end

@implementation TeamViewController

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
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=get_team_list"]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    
    if (data != nil) {
        NSError *error = nil;
        teams = [[NSArray alloc] init];
        teams = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        allTeams = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        displayTeams = [[NSMutableArray alloc] init];
        for (NSDictionary *team in allTeams) {
            [displayTeams addObject:[team objectForKey:@"team_name"]];
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardWillHideNotification object:nil];
        
        [teamListTableView reloadData];
    }
}

-(void)keyboardShown:(NSNotification *)note {
    CGRect keyboardFrame;
    [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
    CGRect tableViewFrame = teamListTableView.frame;
    tableViewFrame.size.height -= keyboardFrame.size.height;
    [teamListTableView setFrame:tableViewFrame];
}

-(void)keyboardHidden:(NSNotification *)note {
    [teamListTableView setFrame:self.view.bounds];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [displayTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    cell = [teamListTableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    NSDictionary *team = [teams objectAtIndex:indexPath.row];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [[cell textLabel] setText:[displayTeams objectAtIndex:indexPath.row]];
    [[cell textLabel] setTextColor:[UIColor blackColor]];
    [[cell detailTextLabel] setText:[team objectForKey:@"dep_name"]];
    [[cell detailTextLabel] setTextColor:[UIColor grayColor]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamDetailViewController *teamDetail = [[TeamDetailViewController alloc] initWithNibName:nil bundle:nil];
    teamDetail.selectedTeam = [teams objectAtIndex:indexPath.row];
    [self presentModalViewController:teamDetail animated:YES];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText length] == 0) {
        [displayTeams removeAllObjects];
        for (NSDictionary *team in allTeams) {
            [displayTeams addObject:[team objectForKey:@"team_name"]];
        }
    } else {
        [displayTeams removeAllObjects];
        for (NSDictionary *team in allTeams) {
            NSRange r = [[team objectForKey:@"team_name"] rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (r.location != NSNotFound) {
                [displayTeams addObject:[team objectForKey:@"team_name"]];
            }
        }
    }
    [teamListTableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar {
    [txtSearchTeam resignFirstResponder];
}

- (void)viewDidUnload
{
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

- (IBAction)btnAddTeam:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[AddTeamViewController alloc] init] CurrentView:self];
}
@end
