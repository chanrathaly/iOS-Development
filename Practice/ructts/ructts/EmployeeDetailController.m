//
//  EmployeeDetailController.m
//  ructts
//
//  Created by apple on 9/21/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "EmployeeDetailController.h"
#import "EmployeeController.h"
#import "EditEmployeeController.h"

@interface EmployeeDetailController ()

@end

@implementation EmployeeDetailController

@synthesize selectedEmp;

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
    lblFN.text = [selectedEmp objectForKey:@"first_name"];
    lblLN.text = [selectedEmp objectForKey:@"last_name"];
    lblSex.text = [selectedEmp objectForKey:@"sex"];
    lblDob.text = [selectedEmp objectForKey:@"dob"];
    lblEmail.text = [selectedEmp objectForKey:@"email"];
    lblRole.text = [selectedEmp objectForKey:@"role"];
    lblStatus.text = [selectedEmp objectForKey:@"status"];
}

- (void)viewDidUnload
{
    lblFN = nil;
    lblLN = nil;
    lblSex = nil;
    lblDob = nil;
    lblEmail = nil;
    lblRole = nil;
    lblStatus = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)btnBack:(id)sender
{
    EmployeeController *emp = [[EmployeeController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:emp animated:YES];
}

-(IBAction)btnEditEmployee:(id)sender
{
    EditEmployeeController *emp = [[EditEmployeeController alloc] initWithNibName:nil bundle:nil];
    emp.selectedEmp = self.selectedEmp;
    [self presentModalViewController:emp animated:YES];
}

@end
