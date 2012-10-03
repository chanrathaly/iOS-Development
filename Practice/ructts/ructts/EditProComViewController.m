//
//  EditProComViewController.m
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "EditProComViewController.h"
#import "Constant.h"
#import "ViewController.h"
#import "ProblemCommentViewController.h"

@interface EditProComViewController ()

@end

@implementation EditProComViewController

@synthesize selectedProCom;

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
    txtProComTitle.text = [selectedProCom objectForKey:@"pc_title"];
    lblProComDate.text = [selectedProCom objectForKey:@"pc_date"];
    lblProComEmp.text = [selectedProCom objectForKey:@"emp_name"];
    txtProComDes.text = [selectedProCom objectForKey:@"pc_description"];
    [txtProComDes sizeToFit];
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
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=edit_aproblem_comment&pc_id=%@&title=%@&description=%@", [selectedProCom objectForKey:@"id"], txtProComTitle.text, txtProComDes.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    
    UIAlertView *msgB = [[UIAlertView alloc] initWithTitle:@"" message:@"Problem comment updated successful." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
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
