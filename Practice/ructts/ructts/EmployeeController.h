//
//  MenuController.h
//  ructts
//
//  Created by apple on 9/20/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *employeeTableView;
    IBOutlet UISearchBar *txtSearchEmp;
    NSArray *employees;
    NSDictionary *allEmps;
    NSMutableArray *displayEmps;
}
- (IBAction)btnNewEmployee:(id)sender;
-(IBAction)btnMenu:(id)sender;
@end
