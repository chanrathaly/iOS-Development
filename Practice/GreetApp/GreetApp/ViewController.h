//
//  ViewController.h
//  GreetApp
//
//  Created by apple on 9/5/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (copy, nonatomic) NSString* userName;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
