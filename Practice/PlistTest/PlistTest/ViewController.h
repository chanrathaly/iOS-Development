//
//  ViewController.h
//  PlistTest
//
//  Created by apple on 9/25/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSString *personName;
    NSMutableArray *phoneNumbers;
}

@property (copy, nonatomic) NSString *personName;
@property (retain, nonatomic) NSMutableArray *phoneNumbers;

@end
