//
//  ViewController.h
//  tableView
//
//  Created by apple on 9/17/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h"

@interface ViewController : UIViewController<UITableViewDataSource>
{
    IBOutlet UITableView *tableView;
    NSMutableArray *cutomers;
}
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *customers;
@end
