//
//  ProblemCommentViewController.m
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ProblemCommentViewController.h"
#import "ViewController.h"
#import "MenuController.h"
#import "AddProblemCommentViewController.h"
#import "Constant.h"
#import "ProblemCommentDetailViewController.h"

@interface ProblemCommentViewController ()

@end

@implementation ProblemCommentViewController

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
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=get_problem_comment_list&emp_role=%@&emp_id=%@",[arr objectAtIndex:7],[arr objectAtIndex:0]]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    
    if (data != nil) {
        NSError *error = nil;
        problem_comments = [[NSArray alloc] init];
        problem_comments = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        [proComTableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [problem_comments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    cell = [proComTableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    NSDictionary *pro_com = [problem_comments objectAtIndex:indexPath.row];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [[cell textLabel] setText:[pro_com objectForKey:@"pc_title"]];
    [[cell textLabel] setTextColor:[UIColor blackColor]];
    [[cell detailTextLabel] setText:[pro_com objectForKey:@"email"]];
    [[cell detailTextLabel] setTextColor:[UIColor grayColor]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProblemCommentDetailViewController *proComDetail = [[ProblemCommentDetailViewController alloc] initWithNibName:nil bundle:nil];
    proComDetail.selectedProCom = [problem_comments objectAtIndex:indexPath.row];
    [self presentModalViewController:proComDetail animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnAddProCom:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[AddProblemCommentViewController alloc] init] CurrentView:self];
}

-(IBAction)btnMenu:(id)sender
{
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[MenuController alloc] init] CurrentView:self];
}

@end
