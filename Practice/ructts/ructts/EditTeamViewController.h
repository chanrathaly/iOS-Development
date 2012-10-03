//
//  EditTeamViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditTeamViewController : UIViewController
{
    NSDictionary *departments;
    NSMutableDictionary *selectedTeam;
    NSMutableArray *depList;
    NSString *selectedDep;
    IBOutlet UITextView *txtTeamDes;
    IBOutlet UIPickerView *depPickerView;
    IBOutlet UITextField *txtTeamName;
}
@property (nonatomic,retain) NSMutableDictionary *selectedTeam;
- (IBAction)btnListTeam:(id)sender;
- (IBAction)btnSaveEditTeam:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
