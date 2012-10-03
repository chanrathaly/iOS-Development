//
//  SecondViewController.h
//  testConnectMySQL
//
//  Created by apple on 9/18/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#define myURL @"http://localhost:8888/first_connection_for_objectc/index.php"
@interface SecondViewController : UIViewController
{
    IBOutlet UITextField *username;
    IBOutlet UITextField *pwd;
    __weak IBOutlet UITextView *lblMsg;
}
-(IBAction)register:(id)sender;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
