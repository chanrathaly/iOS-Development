//
//  ViewController.m
//  GreetApp
//
//  Created by apple on 9/5/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)reset:(id)sender;
- (IBAction)greetMe:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UILabel *lblGreet;
@end

@implementation ViewController
@synthesize txtName;
@synthesize lblGreet;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTxtName:nil];
    [self setLblGreet:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.txtName resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.txtName) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)reset:(id)sender {
    self.lblGreet.text = self.txtName.text = @"";
}

- (IBAction)greetMe:(id)sender {
    self.userName = self.txtName.text;
    
    NSString *nameString = self.userName;
    if ([nameString length]==0) {
        nameString = @"World";
    }
    NSString* greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", nameString];
    self.lblGreet.text = greeting;
}
@end
