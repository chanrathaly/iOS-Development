//
//  EditActionPlanViewController.m
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "EditActionPlanViewController.h"
#import "ActionPlanViewController.h"
#import "ViewController.h"
#import "Constant.h"

@interface EditActionPlanViewController ()

@end

@implementation EditActionPlanViewController
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
    txtApTitle.text = [selectedAp objectForKey:@"ap_title"];
    txtApDes.text = [selectedAp objectForKey:@"ap_description"];
    lblApDate.text = [selectedAp objectForKey:@"ap_date"];
    lblApEmp.text = [selectedAp objectForKey:@"emp_name"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self btnListActionPlan:self];
}

- (IBAction)btnListActionPlan:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[ActionPlanViewController alloc] init] CurrentView:self];
}

- (IBAction)btnSaveEditAp:(id)sender {
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=edit_action_plan&ap_id=%@&title=%@&description=%@", [selectedAp objectForKey:@"id"], txtApTitle.text, txtApDes.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    
    UIAlertView *msgB = [[UIAlertView alloc] initWithTitle:@"" message:@"Action plan updated successful." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [msgB show];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtApTitle resignFirstResponder];
    [txtApDes resignFirstResponder];
}
@end
