//
//  AddEmployeeController.h
//  ructts
//
//  Created by apple on 9/25/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEmployeeController : UIViewController
{
    IBOutlet UITextField *txtFN, *txtLN, *txtSex, *txtDob, *txtEmail, *txtPwd, *txtRole, *txtStatus;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (IBAction)btnBack:(id)sender;
- (IBAction)btnSaveNewEmployee:(id)sender;

@end
