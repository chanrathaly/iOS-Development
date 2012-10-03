//
//  ViewController.h
//  UIPickerView
//
//  Created by apple on 9/28/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableArray *subArray;
}
@property (nonatomic,retain) NSMutableArray *subArray;
@property (weak, nonatomic) IBOutlet UIPickerView *subjectPickerView;

@property (weak, nonatomic) IBOutlet UILabel *lblSelectedVal;
@end
