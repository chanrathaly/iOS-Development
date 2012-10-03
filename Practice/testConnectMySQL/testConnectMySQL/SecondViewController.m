//
//  SecondViewController.m
//  testConnectMySQL
//
//  Created by apple on 9/18/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    lblMsg = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [username resignFirstResponder];
    [pwd resignFirstResponder];
}

- (void)register:(id)sender
{
    if ([username.text isEqualToString:@""] || [pwd.text isEqualToString:@""]) {
        NSString *msg = [[NSString alloc] init];
        if ([pwd.text isEqualToString:@""]) msg = @"Password is required.";
        if ([username.text isEqualToString:@""]) msg = @"Username is required.";
        UIAlertView *alertBox = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertBox show];
    } else {
        NSMutableString *userString = [NSMutableString stringWithString:myURL];
        [userString appendString:[NSMutableString stringWithFormat:@"?action=register&user_name=%@",username.text]];
        [userString appendString:[NSMutableString stringWithFormat:@"&pwd=%@",pwd.text]];
        [userString setString:[userString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [NSData dataWithContentsOfURL:[NSURL URLWithString:userString]];
        
        NSLog(@"%@", userString);
        UIAlertView *alertBox = [[UIAlertView alloc] initWithTitle:@"" message:@"Register success" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertBox show];
//        lblMsg.text = @"Submit sent.";
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:4.0];
//        [lblMsg setAlpha:0];
//        [UIView setAnimationDuration:0.3];
//        username.text = pwd.text = nil;
    }
}

@end
