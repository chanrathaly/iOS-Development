//
//  ProblemCommentDetailViewController.m
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ProblemCommentDetailViewController.h"
#import "ViewController.h"
#import "ProblemCommentViewController.h"
#import "EditProComViewController.h"

@interface ProblemCommentDetailViewController ()

@end

@implementation ProblemCommentDetailViewController

@synthesize selectedProCom;

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
    lblProComTitle.text = [selectedProCom objectForKey:@"pc_title"];
    lblProComDate.text = [selectedProCom objectForKey:@"pc_date"];
    lblProComEmp.text = [selectedProCom objectForKey:@"emp_name"];
    lblProComDes.text = [selectedProCom objectForKey:@"pc_description"];
    [lblProComDes sizeToFit];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnListProCom:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[ProblemCommentViewController alloc] init] CurrentView:self];
}

- (IBAction)btnEditProCom:(id)sender {
    EditProComViewController *editProComView = [[EditProComViewController alloc] initWithNibName:nil bundle:nil];
    editProComView.selectedProCom = self.selectedProCom;
    [self presentModalViewController:editProComView animated:YES];
}
@end
