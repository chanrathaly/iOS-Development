//
//  DepDetailViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DepDetailViewController : UIViewController
{
    NSMutableDictionary *selectedDep;
    IBOutlet UILabel *lblDepDes, *lblDepName;
}
@property (nonatomic,retain) NSMutableDictionary *selectedDep;
- (IBAction)btnListDep:(id)sender;
- (IBAction)btnEditDep:(id)sender;

@end
