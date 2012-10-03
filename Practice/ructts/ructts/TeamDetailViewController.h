//
//  TeamDetailViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamDetailViewController : UIViewController
{
    NSMutableDictionary *selectedTeam;
    IBOutlet UILabel *lblDepName, *lblTeamName, *lblTeamDes;
}
@property (nonatomic,retain) NSMutableDictionary *selectedTeam;
- (IBAction)btnTeamList:(id)sender;
- (IBAction)btnEditTeam:(id)sender;
@end
