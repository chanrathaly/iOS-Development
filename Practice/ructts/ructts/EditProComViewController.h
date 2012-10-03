//
//  EditProComViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProComViewController : UIViewController
{
    NSMutableDictionary *selectedProCom;
    IBOutlet UITextView *txtProComDes, *txtProComTitle;
    IBOutlet UILabel *lblProComEmp, *lblProComDate;
}
@property (nonatomic,retain) NSMutableDictionary *selectedProCom;
- (IBAction)btnListProCom:(id)sender;
- (IBAction)btnSaveProCom:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
