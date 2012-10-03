//
//  ActionPlanDetailViewController.m
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ActionPlanDetailViewController.h"
#import "ViewController.h"
#import "ActionPlanViewController.h"
#import "AddActionPlanViewController.h"
#import "EditActionPlanViewController.h"

@interface ActionPlanDetailViewController ()

@end

@implementation ActionPlanDetailViewController

@synthesize selectedAp;

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
    lblApTitle.text = [selectedAp objectForKey:@"ap_title"];
    lblApDate.text = [selectedAp objectForKey:@"ap_date"];
    lblApEmp.text = [selectedAp objectForKey:@"emp_name"];
    lblApDes.text = [selectedAp objectForKey:@"ap_description"];
    [lblApDes sizeToFit];
    lblApDes.textColor = [UIColor blackColor];
}

- (void)viewDidUnload
{
    lblApTitle = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnEditAp:(id)sender {
    EditActionPlanViewController *editApView = [[EditActionPlanViewController alloc] initWithNibName:nil bundle:nil];
    editApView.selectedAp = self.selectedAp;
    [self presentModalViewController:editApView animated:YES];
}

- (IBAction)btnListActionPlan:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[ActionPlanViewController alloc] init] CurrentView:self];
}
@end
