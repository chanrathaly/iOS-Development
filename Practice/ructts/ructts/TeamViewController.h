//
//  TeamViewController.h
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamViewController : UIViewController
{
    NSArray *teams;
    IBOutlet UISearchBar *txtSearchTeam;
    IBOutlet UITableView *teamListTableView;
    NSDictionary *allTeams;
    NSMutableArray *displayTeams;
}
- (IBAction)btnAddTeam:(id)sender;
-(IBAction)btnMenu:(id)sender;
@end
