//
//  ActionPlanViewController.h
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionPlanViewController : UIViewController
{
    NSArray *action_plans;
    IBOutlet UITableView *actionPlanTableView;
}
- (IBAction)btnAddActionPlan:(id)sender;
-(IBAction)btnMenu:(id)sender;
@end
