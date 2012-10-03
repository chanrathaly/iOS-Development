//
//  AddSuggestionViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddSuggestionViewController : UIViewController
{
    IBOutlet UITextField *txtSugTitle;
    IBOutlet UITextView *txtSugDes;
}
- (IBAction)btnListSug:(id)sender;
- (IBAction)btnSaveSug:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
