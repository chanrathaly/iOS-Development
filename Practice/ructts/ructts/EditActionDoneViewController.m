//
//  EditActionDoneViewController.m
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "EditActionDoneViewController.h"
#import "ActionDoneViewController.h"
#import "Constant.h"
#import "ViewController.h"

@interface EditActionDoneViewController ()

@end

@implementation EditActionDoneViewController

@synthesize selectedAd;

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
    txtAdTitle.text = [selectedAd objectForKey:@"ad_title"];
    lblAdDate.text = [selectedAd objectForKey:@"ad_date"];
    lblAdEmp.text = [selectedAd objectForKey:@"emp_name"];
    txtAdDes.text = [selectedAd objectForKey:@"ad_description"];
    [txtAdDes sizeToFit];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtAdTitle resignFirstResponder];
    [txtAdDes resignFirstResponder];
}

- (void)viewDidUnload
{
    txtAdTitle = nil;
    lblAdDate = nil;
    lblAdEmp = nil;
    txtAdDes = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnListAD:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[ActionDoneViewController alloc] init] CurrentView:self];
}

- (IBAction)btnSaveEditAd:(id)sender {
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=edit_action_done&ad_id=%@&title=%@&description=%@", [selectedAd objectForKey:@"id"], txtAdTitle.text, txtAdDes.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    
    UIAlertView *msgB = [[UIAlertView alloc] initWithTitle:@"" message:@"Action done updated successful." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [msgB show];
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self btnListAD:self];
}
@end
