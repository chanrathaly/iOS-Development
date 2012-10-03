//
//  AddProblemCommentViewController.h
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddProblemCommentViewController : UIViewController
{
    IBOutlet UITextField *txtProComTitle;
    IBOutlet UITextView *txtProComDes;
}
- (IBAction)btnListProCom:(id)sender;
- (IBAction)btnSaveProCom:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
