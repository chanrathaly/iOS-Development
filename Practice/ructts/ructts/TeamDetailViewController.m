//
//  TeamDetailViewController.m
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "TeamDetailViewController.h"
#import "ViewController.h"
#import "TeamViewController.h"
#import "EditTeamViewController.h"

@interface TeamDetailViewController ()

@end

@implementation TeamDetailViewController

@synthesize selectedTeam;

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
    lblTeamName.text = [selectedTeam objectForKey:@"team_name"];
    lblDepName.text = [selectedTeam objectForKey:@"dep_name"];
    lblTeamDes.text = [selectedTeam objectForKey:@"team_description"];
    [lblTeamDes sizeToFit];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnTeamList:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[TeamViewController alloc] init] CurrentView:self];
}

- (IBAction)btnEditTeam:(id)sender {
    EditTeamViewController *editTeamView = [[EditTeamViewController alloc] initWithNibName:nil bundle:nil];
    editTeamView.selectedTeam = self.selectedTeam;
    [self presentModalViewController:editTeamView animated:YES];
}
@end
