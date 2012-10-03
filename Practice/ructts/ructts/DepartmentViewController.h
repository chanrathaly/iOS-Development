//
//  DepartmentViewController.h
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DepartmentViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    IBOutlet UISearchBar *txtSearchDep;
    IBOutlet UITableView *depListTableView;
    NSArray *departments;
    NSMutableArray *displayDepartments;
    NSDictionary *allDeps;
}

- (IBAction)btnAddDep:(id)sender;
-(IBAction)btnMenu:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
