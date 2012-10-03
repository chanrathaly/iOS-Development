//
//  AddDeptViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddDeptViewController : UIViewController
{
    IBOutlet UITextField *txtDepName;
    IBOutlet UITextView *txtDepDes;
}
- (IBAction)btnListDep:(id)sender;
- (IBAction)btnSaveDep:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
