//
//  ViewController.h
//  ructts
//
//  Created by apple on 9/19/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextField *email;
    IBOutlet UITextField *pwd;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(IBAction)login:(id)sender;
-(IBAction)switchMe:(id)sender;
-(void)switchUIView:(UIViewController *)targetView CurrentView:(UIViewController *)viewObj;
@end
