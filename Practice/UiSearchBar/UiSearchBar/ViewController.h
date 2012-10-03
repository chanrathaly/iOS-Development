//
//  ViewController.h
//  UiSearchBar
//
//  Created by apple on 10/2/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UISearchBar *searchBar;
    IBOutlet UITableView *tableView;
    
    NSArray *allItems;
    NSMutableArray *displayItems;
}
@end
