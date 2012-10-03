//
//  ProblemCommentDetailViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProblemCommentDetailViewController : UIViewController
{
    NSMutableDictionary *selectedProCom;
    IBOutlet UILabel *lblProComTitle, *lblProComDate, *lblProComEmp, *lblProComDes;
}
@property (nonatomic,retain) NSMutableDictionary *selectedProCom;
- (IBAction)btnListProCom:(id)sender;
- (IBAction)btnEditProCom:(id)sender;

@end
