//
//  SuggestionViewController.h
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuggestionViewController : UIViewController
{
    NSArray *suggestions;
    IBOutlet UITableView *sugListTableView;
}
- (IBAction)btnAddSug:(id)sender;
-(IBAction)btnMenu:(id)sender;
@end
