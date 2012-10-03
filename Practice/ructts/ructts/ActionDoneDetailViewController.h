//
//  ActionDoneDetailViewController.h
//  ructts
//
//  Created by apple on 9/26/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionDoneDetailViewController : UIViewController
{
    NSMutableDictionary *selectedAd;
    IBOutlet UILabel *lblAdDes, *lblAdDate, *lblAdEmp, *lblAdTitle;
}
@property (nonatomic,retain) NSMutableDictionary *selectedAd;
- (IBAction)btnListActionDone:(id)sender;
- (IBAction)btnEditActionDone:(id)sender;

@end
