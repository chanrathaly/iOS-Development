//
//  SuggestionDetailViewController.m
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "SuggestionDetailViewController.h"
#import "ViewController.h"
#import "SuggestionViewController.h"
#import "EditSuggestionViewController.h"

@interface SuggestionDetailViewController ()

@end

@implementation SuggestionDetailViewController

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
    lblSugTitle.text = [selectedSug objectForKey:@"sug_title"];
    lblSugDate.text = [selectedSug objectForKey:@"sug_date"];
    lblSugEmp.text = [selectedSug objectForKey:@"emp_name"];
    lblSugDes.text = [selectedSug objectForKey:@"sug_description"];
    [lblSugDes sizeToFit];
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

- (IBAction)btnEditSug:(id)sender {
    EditSuggestionViewController *editSugView = [[EditSuggestionViewController alloc] initWithNibName:nil bundle:nil];
    editSugView.selectedSug = self.selectedSug;
    [self presentModalViewController:editSugView animated:YES];
}
@end
