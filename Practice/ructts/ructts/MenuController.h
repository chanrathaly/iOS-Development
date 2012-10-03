//
//  MenuController.h
//  ructts
//
//  Created by apple on 9/21/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuController : UIViewController
{
    IBOutlet UITableView *menuTableView;
    NSMutableArray *menuItems;
}

@property (nonatomic, retain) NSMutableArray *menuItems;
@property (nonatomic, retain) IBOutlet UITableView *menuTableView;

@end
