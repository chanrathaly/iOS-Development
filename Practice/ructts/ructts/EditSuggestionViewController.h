//
//  EditSuggestionViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditSuggestionViewController : UIViewController
{
    NSMutableDictionary *selectedSug;
    IBOutlet UITextView *txtSugDes, *txtSugTitle;
    IBOutlet UILabel *lblSugEmp, *lblSugDate;
}
@property (nonatomic,retain) NSMutableDictionary *selectedSug;
- (IBAction)btnListSug:(id)sender;
- (IBAction)btnSaveEditSug:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
