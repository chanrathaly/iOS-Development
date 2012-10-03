//
//  ViewController.h
//  testConnectMySQL
//
//  Created by apple on 9/18/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#define myURL @"http://localhost:8888/first_connection_for_objectc/index.php"

@class UserListViewController;

@interface ViewController : UIViewController
{
    IBOutlet UITextField *user_name;
    IBOutlet UITextField *pwd;
    
    IBOutlet UserListViewController *userListViewController;
}
-(IBAction)login:(id)sender;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
