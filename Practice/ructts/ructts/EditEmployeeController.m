//
//  EditEmployeeController.m
//  ructts
//
//  Created by apple on 9/21/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "EditEmployeeController.h"
#import "EmployeeController.h"
#import "Constant.h"

@interface EditEmployeeController ()

@end

@implementation EditEmployeeController

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
    txtFn.text = [selectedEmp objectForKey:@"first_name"];
    txtLn.text = [selectedEmp objectForKey:@"last_name"];
    txtSex.text = [selectedEmp objectForKey:@"sex"];
    txtDob.text = [selectedEmp objectForKey:@"dob"];
    txtEmail.text = [selectedEmp objectForKey:@"email"];
    txtRole.text = [selectedEmp objectForKey:@"role"];
    txtStatus.text = [selectedEmp objectForKey:@"status"];
}

- (void)viewDidUnload
{
    txtFn = nil;
    txtLn = nil;
    txtSex = nil;
    txtDob = nil;
    txtEmail = nil;
    txtRole = nil;
    txtStatus = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtFn resignFirstResponder];
    [txtLn resignFirstResponder];
    [txtEmail resignFirstResponder];
    [txtRole resignFirstResponder];
    [txtDob resignFirstResponder];
    [txtStatus resignFirstResponder];
    [txtSex resignFirstResponder];
}

- (IBAction)btnListEmp:(id)sender {
    EmployeeController *empList = [[EmployeeController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:empList animated:YES];
}

- (IBAction)btnSaveEditEmp:(id)sender {
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=edit_emp&emp_id=%@&fn=%@&ln=%@&sex=%@&dob=%@&email=%@&role=%@&status=%@", [selectedEmp objectForKey:@"id"], txtFn.text, txtLn.text, txtSex.text, txtDob.text, txtEmail.text, txtRole.text, txtStatus.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    
    UIAlertView *msgB = [[UIAlertView alloc] initWithTitle:@"" message:@"Employee updated successful." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [msgB show];
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self btnListEmp:self];
}
@end
