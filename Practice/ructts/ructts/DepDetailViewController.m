//
//  DepDetailViewController.m
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "DepDetailViewController.h"
#import "ViewController.h"
#import "DepartmentViewController.h"
#import "EditDepViewController.h"

@interface DepDetailViewController ()

@end

@implementation DepDetailViewController

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
    lblDepName.text = [selectedDep objectForKey:@"dep_name"];
    lblDepDes.text = [selectedDep objectForKey:@"dep_description"];
    [lblDepDes sizeToFit];
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

- (IBAction)btnEditDep:(id)sender {
    EditDepViewController *editDepView = [[EditDepViewController alloc] initWithNibName:nil bundle:nil];
    editDepView.selectedDep = self.selectedDep;
    [self presentModalViewController:editDepView animated:YES];
}
@end
