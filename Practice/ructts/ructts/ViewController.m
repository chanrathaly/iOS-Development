//
//  ViewController.m
//  ructts
//
//  Created by apple on 9/19/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ViewController.h"
#import "Constant.h"
#import "EmployeeController.h"
#import "MenuController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)switchMe:(id)sender
{
    EmployeeController *menuController = [[EmployeeController alloc] initWithNibName:nil bundle:nil];
    menuController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:menuController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [email resignFirstResponder];
    [pwd resignFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)login:(id)sender
{
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=login&email=%@", email.text]];
    [serviceURL appendString:[NSMutableString stringWithFormat:@"&pwd=%@", pwd.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    NSString *requestResponse = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];

    if ([requestResponse isEqualToString:@""])
    {
        UIAlertView *loginMsg = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Incorrect email and password." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [loginMsg show];
    }
    else
    {
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *plistPath = [rootPath stringByAppendingPathComponent:@"AuthenticatedUserData.plist"];

        NSError *error = nil;
        NSDictionary *authedUser = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        NSArray *myUser = [[NSArray alloc] initWithObjects:[authedUser objectForKey:@"id"], [authedUser objectForKey:@"first_name"], [authedUser objectForKey:@"last_name"], [authedUser objectForKey:@"sex"], [authedUser objectForKey:@"dob"], [authedUser objectForKey:@"email"], [authedUser objectForKey:@"password"], [authedUser objectForKey:@"role"], [authedUser objectForKey:@"status"], nil];

        [myUser writeToFile:plistPath atomically:YES];

        MenuController *menuPage = [[MenuController alloc] init];
        [self presentModalViewController:menuPage animated:YES];
    }
}

-(void)switchUIView:(UIViewController *)targetView CurrentView:(UIViewController *)currentView
{
    [currentView presentModalViewController:targetView animated:YES];
}

//- (void)keyboardDidShow:(NSNotification *)note
//{
//    self.view.center = CGPointMake(0, 0);
//}

@end