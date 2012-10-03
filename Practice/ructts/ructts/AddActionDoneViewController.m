//
//  AddActionDoneViewController.m
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "AddActionDoneViewController.h"
#import "ViewController.h"
#import "ActionDoneViewController.h"
#import "Constant.h"

@interface AddActionDoneViewController ()

@end

@implementation AddActionDoneViewController

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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtADoneDes resignFirstResponder];
    [txtADoneTitle resignFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnListActionDone:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[ActionDoneViewController alloc] init] CurrentView:self];
}

- (IBAction)btnSaveActionDone:(id)sender {
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"AuthenticatedUserData.plist"];
    [[NSFileManager defaultManager] fileExistsAtPath:plistPath];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSString stringWithFormat:@"index.php?action=new_action_done&emp_id=%@&title=%@&description=%@", [arr objectAtIndex:0], txtADoneTitle.text, txtADoneDes.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    UIAlertView *msgB = [[UIAlertView alloc] initWithTitle:@"" message:@"Action done added successful." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [msgB show];
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self btnListActionDone:self];
}
@end
