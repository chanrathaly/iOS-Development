//
//  ActionDoneViewController.h
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionDoneViewController : UIViewController
{
    NSArray *action_dones;
    IBOutlet UITableView *actionDoneTableView;
}
- (IBAction)btnAddAction:(id)sender;
-(IBAction)btnMenu:(id)sender;
@end
