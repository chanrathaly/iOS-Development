//
//  EditActionPlanViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditActionPlanViewController : UIViewController
{
    NSMutableDictionary *selectedAp;
    IBOutlet UILabel *lblApDate, *lblApEmp;
    IBOutlet UITextField *txtApTitle;
    IBOutlet UITextView *txtApDes;
}
@property (nonatomic,retain) NSMutableDictionary *selectedAp;
- (IBAction)btnListActionPlan:(id)sender;
- (IBAction)btnSaveEditAp:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
