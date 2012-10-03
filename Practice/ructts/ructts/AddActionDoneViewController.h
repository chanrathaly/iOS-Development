//
//  AddActionDoneViewController.h
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddActionDoneViewController : UIViewController
{
    IBOutlet UITextField *txtADoneTitle;
    IBOutlet UITextView *txtADoneDes;
}
- (IBAction)btnListActionDone:(id)sender;
- (IBAction)btnSaveActionDone:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
