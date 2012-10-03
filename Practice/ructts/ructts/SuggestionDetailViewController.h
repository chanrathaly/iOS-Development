//
//  SuggestionDetailViewController.h
//  ructts
//
//  Created by apple on 9/27/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuggestionDetailViewController : UIViewController
{
    NSMutableDictionary *selectedSug;
    IBOutlet UILabel *lblSugDes, *lblSugEmp, *lblSugDate, *lblSugTitle;
}
@property (nonatomic,retain) NSMutableDictionary *selectedSug;
- (IBAction)btnListSug:(id)sender;
- (IBAction)btnEditSug:(id)sender;
@end
