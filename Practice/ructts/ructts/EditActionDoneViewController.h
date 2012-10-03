//
//  EditActionDoneViewController.h
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditActionDoneViewController : UIViewController
{
    NSMutableDictionary *selectedAd;
    IBOutlet UITextField *txtAdTitle, *txtAdDes;
    IBOutlet UILabel *lblAdDate, *lblAdEmp;
}
- (IBAction)btnListAD:(id)sender;
- (IBAction)btnSaveEditAd:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@property (nonatomic,retain) NSMutableDictionary *selectedAd;
@end
