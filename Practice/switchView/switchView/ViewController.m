//
//  ViewController.m
//  switchView
//
//  Created by apple on 9/19/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ViewController.h"
#import "SecondView.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)switchView:(id)sender
{
    SecondView *sv = [[SecondView alloc] initWithNibName:nil bundle:nil];
    //[self presentModalViewController:sv animated:YES];
    [self presentViewController:sv animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
