//
//  SecondView.m
//  switchView
//
//  Created by apple on 9/19/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "SecondView.h"
#import "ViewController.h"

@interface SecondView ()

@end

@implementation SecondView

-(IBAction)switchBack:(id)sender
{
    ViewController *vc = [[ViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:vc animated:YES];
}

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
