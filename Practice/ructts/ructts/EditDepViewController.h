//
//  EditDepViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditDepViewController : UIViewController
{
    NSMutableDictionary *selectedDep;
    IBOutlet UITextView *txtDepDes;
    IBOutlet UITextField *txtDepName;
}
@property (nonatomic,retain) NSMutableDictionary *selectedDep;
- (IBAction)btnListDep:(id)sender;
- (IBAction)btnSaveEditDep:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
