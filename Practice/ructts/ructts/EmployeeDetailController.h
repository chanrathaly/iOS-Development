//
//  EmployeeDetailController.h
//  ructts
//
//  Created by apple on 9/21/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeDetailController : UIViewController
{
    IBOutlet UILabel *lblFN, *lblLN, *lblSex, *lblDob, *lblEmail, *lblRole, *lblStatus;
    NSMutableDictionary *selectedEmp;
}
@property (nonatomic, retain) NSMutableDictionary *selectedEmp;
-(IBAction)btnBack:(id)sender;
-(IBAction)btnEditEmployee:(id)sender;
@end
