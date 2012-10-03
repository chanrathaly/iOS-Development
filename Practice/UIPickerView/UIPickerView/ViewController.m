//
//  ViewController.m
//  UIPickerView
//
//  Created by apple on 9/28/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize subjectPickerView;
@synthesize lblSelectedVal;

- (void)viewDidLoad
{
    [super viewDidLoad];
    subArray = [[NSMutableArray alloc] init];
    [subArray addObject:@" 100 "];
    [subArray addObject:@" 200 "];
    [subArray addObject:@" 400 "];
    [subArray addObject:@" 600 "];
    [subArray addObject:@" 1000 "];
    
    [subjectPickerView selectRow:1 inComponent:0 animated:NO];
    lblSelectedVal.text= [subArray objectAtIndex:[subjectPickerView selectedRowInComponent:0]];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 2;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    lblSelectedVal.text=    [subArray objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [subArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [subArray objectAtIndex:row];
}

- (void)viewDidUnload
{
    [self setSubjectPickerView:nil];
    [self setLblSelectedVal:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
