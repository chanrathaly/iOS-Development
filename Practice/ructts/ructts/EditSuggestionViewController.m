//
//  EditSuggestionViewController.m
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "EditSuggestionViewController.h"
#import "Constant.h"
#import "ViewController.h"
#import "SuggestionViewController.h"

@interface EditSuggestionViewController ()

@end

@implementation EditSuggestionViewController

@synthesize selectedSug;

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
    txtSugTitle.text = [selectedSug objectForKey:@"sug_title"];
    lblSugDate.text = [selectedSug objectForKey:@"sug_date"];
    lblSugEmp.text = [selectedSug objectForKey:@"emp_name"];
    txtSugDes.text = [selectedSug objectForKey:@"sug_description"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnListSug:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[SuggestionViewController alloc] init] CurrentView:self];
}

- (IBAction)btnSaveEditSug:(id)sender {
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=edit_suggestion&sug_id=%@&title=%@&description=%@", [selectedSug objectForKey:@"id"], txtSugTitle.text, txtSugDes.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];
    
    UIAlertView *msgB = [[UIAlertView alloc] initWithTitle:@"" message:@"Suggestion updated successful." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [msgB show];
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self btnListSug:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtSugTitle resignFirstResponder];
    [txtSugDes resignFirstResponder];
}
@end
