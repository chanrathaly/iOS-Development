//
//  ActionDoneDetailViewController.m
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ActionDoneDetailViewController.h"
#import "ViewController.h"
#import "ActionDoneViewController.h"
#import "EditActionDoneViewController.h"

@interface ActionDoneDetailViewController ()

@end

@implementation ActionDoneDetailViewController

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
    lblAdTitle.text = [selectedAd objectForKey:@"ad_title"];
    lblAdDate.text = [selectedAd objectForKey:@"ad_date"];
    lblAdEmp.text = [selectedAd objectForKey:@"emp_name"];
    lblAdDes.text = [selectedAd objectForKey:@"ad_description"];
    [lblAdDes sizeToFit];
}

- (void)viewDidUnload
{
    lblAdDes = nil;
    lblAdTitle = nil;
    lblAdDate = nil;
    lblAdEmp = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnListActionDone:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[ActionDoneViewController alloc] init] CurrentView:self];
}

- (IBAction)btnEditActionDone:(id)sender {
    EditActionDoneViewController *editAdView = [[EditActionDoneViewController alloc] initWithNibName:nil bundle:nil];
    editAdView.selectedAd = self.selectedAd;
    [self presentModalViewController:editAdView animated:YES];
}
@end
