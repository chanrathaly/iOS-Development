//
//  AddTeamViewController.m
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "AddTeamViewController.h"
#import "TeamViewController.h"
#import "ViewController.h"
#import "Constant.h"

@interface AddTeamViewController ()

@end

@implementation AddTeamViewController

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
    
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSMutableString stringWithFormat:@"index.php?action=get_department_list"]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];    
    
    if (data != nil) {
        NSError *error = nil;
        departments = [[NSDictionary alloc] init];
        departments = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    }
    depList = [[NSMutableArray alloc] init];
    for (NSDictionary *department in departments) {
        [depList addObject:[department objectForKey:@"dep_name"]];
    }
    [depPicker selectRow:3 inComponent:0 animated:NO];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtTeamName resignFirstResponder];
    [txtTeamDes resignFirstResponder];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    selectedDep = [depList objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [depList count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [depList objectAtIndex:row];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnListTeam:(id)sender {
    ViewController *mainView = [[ViewController alloc] init];
    [mainView switchUIView:[[TeamViewController alloc] init] CurrentView:self];
}

- (IBAction)btnSaveTeam:(id)sender {
    NSMutableString *serviceURL = [[NSMutableString alloc] initWithString:webserviceURL];
    [serviceURL appendString:[NSString stringWithFormat:@"index.php?action=new_team&team_name=%@&dep_name=%@&description=%@", txtTeamName.text, selectedDep, txtTeamDes.text]];
    [serviceURL setString:[serviceURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSData dataWithContentsOfURL:[NSURL URLWithString:serviceURL]];

    UIAlertView *msgB = [[UIAlertView alloc] initWithTitle:@"" message:@"Team added successful." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [msgB show];
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self btnListTeam:self];
}

@end
