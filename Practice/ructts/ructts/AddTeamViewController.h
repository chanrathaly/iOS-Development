//
//  AddTeamViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTeamViewController : UIViewController
{
    NSDictionary *departments;
    NSMutableArray *depList;
    NSString *selectedDep;
    IBOutlet UITextView *txtTeamDes;
    IBOutlet UITextField *txtTeamName;
    IBOutlet UIPickerView *depPicker;
}
- (IBAction)btnListTeam:(id)sender;
- (IBAction)btnSaveTeam:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
