//
//  ProblemCommentViewController.h
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProblemCommentViewController : UIViewController
{
    NSArray *problem_comments;
    IBOutlet UITableView *proComTableView;
}
- (IBAction)btnAddProCom:(id)sender;
-(IBAction)btnMenu:(id)sender;
@end
