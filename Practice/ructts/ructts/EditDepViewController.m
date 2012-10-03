//
//  EditDepViewController.m
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "EditDepViewController.h"
#import "ViewController.h"
#import "DepartmentViewController.h"
#import "Constant.h"

@interface EditDepViewController ()

@end

@implementation EditDepViewController

@synthesize selectedDep;

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
    txtDepName.text = [selectedDep objectForKey:@"dep_name"];
    txtDepDes.text = [selectedDep objectForKey:@"dep_description"];
    [txtDepDes sizeToFit];
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

- (IBAction)btnSaveEditDep:(id)sender {
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=edit_department&dep_id=%@&dep_name=%@&description=%@", [selectedDep objectForKey:@"id"], txtDepName.text, txtDepDes.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    
    UIAlertView *msgB = [[UIAlertView alloc] initWithTitle:@"" message:@"Department updated successful." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [msgB show];
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self btnListDep:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtDepName resignFirstResponder];
    [txtDepDes resignFirstResponder];
}
@end
