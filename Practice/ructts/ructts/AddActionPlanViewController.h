//
//  AddActionPlanViewController.h
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddActionPlanViewController : UIViewController
{
    IBOutlet UITextField *txtApTitle;
    IBOutlet UITextView *txtApDes;
}
- (IBAction)btnSaveAp:(id)sender;
- (IBAction)btnListActionPlan:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
