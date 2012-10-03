//
//  ViewController.m
//  testConnectMySQL
//
//  Created by apple on 9/18/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ViewController.h"
#import "UserListViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [user_name resignFirstResponder];
    [pwd resignFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)login:(id)sender
{
//    NSMutableString *userString = [NSMutableString stringWithString:myURL];
//    [userString appendString:[NSMutableString stringWithFormat:@"?action=register&user_name=%@",username.text]];
//    [userString appendString:[NSMutableString stringWithFormat:@"&pwd=%@",pwd.text]];
//    [userString setString:[userString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    [NSData dataWithContentsOfURL:[NSURL URLWithString:userString]];
    
    
    NSMutableString *userString = [NSMutableString stringWithString:myURL];
    [userString appendString:[NSMutableString stringWithFormat:@"?action=login&user_name=%@", user_name.text]];
    [userString appendString:[NSMutableString stringWithFormat:@"&pwd=%@", pwd.text]];
    [userString setString:[userString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:userString]];
    
    NSString *reponseOutput = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    if ([reponseOutput isEqualToString:@"1"]) {
        UIAlertView *loginMsg = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Success Authorized." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [loginMsg show];
//        SecondViewController *usrVC = [[SecondViewController alloc] init];
//        [self.navigationController pushViewController: usrVC animated: YES];
        [self presentModalViewController:SecondViewController animated:<#(BOOL)#>];
    } else {
        UIAlertView *loginMsg = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Incorrect username and password." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [loginMsg show];        
    }
}

@end
