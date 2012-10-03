//
//  ViewController.m
//  tableView
//
//  Created by apple on 9/17/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tableView, customers;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.customers = [[NSMutableArray alloc] init];
  
    for (int i=1; i<=20; i++) {
        Customer *customer = [[Customer alloc] init];
        customer.name = [NSString stringWithFormat:@"Name %.2d", i];        
        [self.customers addObject:customer];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [customers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *uniquIdentifier = @"UITableViewCell";
    UITableViewCell *cell = nil;
    
    cell = [self.tableView dequeueReusableCellWithIdentifier:uniquIdentifier];
    
    Customer *customer = [self.customers objectAtIndex:[indexPath row]];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:uniquIdentifier];
        [[cell textLabel] setText:customer.name];
        [[cell textLabel] setTextColor:[UIColor blackColor]];
    }
    return cell;
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
