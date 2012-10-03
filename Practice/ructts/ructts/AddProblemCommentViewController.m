//
//  AddProblemCommentViewController.m
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "AddProblemCommentViewController.h"
#import "ViewController.h"
#import "ProblemCommentViewController.h"
#import "Constant.h"

@interface AddProblemCommentViewController ()

@end

@implementation AddProblemCommentViewController

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

- (IBAction)btnListProCom:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[ProblemCommentViewController alloc] init] CurrentView:self];
}

- (IBAction)btnSaveProCom:(id)sender {
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"AuthenticatedUserData.plist"];
    [[NSFileManager defaultManager] fileExistsAtPath:plistPath];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSString stringWithFormat:@"index.php?action=new_problem_comment&emp_id=%@&title=%@&description=%@", [arr objectAtIndex:0], txtProComTitle.text, txtProComDes.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    UIAlertView *msgB = [[UIAlertView alloc] initWithTitle:@"" message:@"Problem comment added successful." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [msgB show];
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self btnListProCom:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtProComTitle resignFirstResponder];
    [txtProComDes resignFirstResponder];
}
@end
