//
//  AddEmployeeController.m
//  ructts
//
//  Created by apple on 9/25/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "Constant.h"
#import "AddEmployeeController.h"
#import "EmployeeController.h"

@interface AddEmployeeController ()

@end

@implementation AddEmployeeController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    txtFN = nil;
    txtLN = nil;
    txtSex = nil;
    txtDob = nil;
    txtEmail = nil;
    txtPwd = nil;
    txtRole = nil;
    txtStatus = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtFN resignFirstResponder];
    [txtLN resignFirstResponder];
    [txtEmail resignFirstResponder];
    [txtPwd resignFirstResponder];
    [txtRole resignFirstResponder];
    [txtDob resignFirstResponder];
    [txtStatus resignFirstResponder];
    [txtSex resignFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnBack:(id)sender {
    EmployeeController *empList = [[EmployeeController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:empList animated:YES];
}

- (IBAction)btnSaveNewEmployee:(id)sender {
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSString stringWithFormat:@"index.php?action=register_employee&fn=%@&ln=%@&sex=%@&dob=%@&email=%@&pwd=%@&role=%@&status=%@", txtFN.text, txtLN.text, txtSex.text, txtDob.text, txtEmail.text, txtPwd.text, txtRole.text, txtStatus.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    UIAlertView *msgB = [[UIAlertView alloc] initWithTitle:@"" message:@"Employee added successful." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [msgB show];
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self btnBack:self];
}

@end
