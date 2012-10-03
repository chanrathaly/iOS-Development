//
//  ActionPlanDetailViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionPlanDetailViewController : UIViewController
{
    NSMutableDictionary *selectedAp;
    IBOutlet UILabel *lblApTitle, *lblApDate, *lblApEmp, *lblApDes;
}
@property (nonatomic,retain) NSMutableDictionary *selectedAp;
- (IBAction)btnEditAp:(id)sender;
- (IBAction)btnListActionPlan:(id)sender;
@end
