//
//  EditEmployeeController.h
//  ructts
//
//  Created by apple on 9/21/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditEmployeeController : UIViewController
{
    IBOutlet UITextField *txtFn, *txtLn, *txtSex, *txtDob, *txtStatus, *txtRole, *txtEmail;
    NSMutableDictionary *selectedEmp;
}
- (IBAction)btnSaveEditEmp:(id)sender;
@property (nonatomic, retain) NSMutableDictionary *selectedEmp;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (IBAction)btnListEmp:(id)sender;
@end
