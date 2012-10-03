//
//  AddDeptViewController.m
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "AddDeptViewController.h"
#import "Constant.h"
#import "ViewController.h"
#import "DepartmentViewController.h"

@interface AddDeptViewController ()

@end

@implementation AddDeptViewController

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnListDep:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[DepartmentViewController alloc] init] CurrentView:self];
}

- (IBAction)btnSaveDep:(id)sender {    
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSString stringWithFormat:@"index.php?action=new_department&dep_name=%@&description=%@", txtDepName.text, txtDepDes.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    UIAlertView *msgB = [[UIAlertView alloc] initWithTitle:@"" message:@"Department added successful." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [msgB show];
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self btnListDep:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"a");
    [txtDepName resignFirstResponder];
    [txtDepDes resignFirstResponder];
}
@end
