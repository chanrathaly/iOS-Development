//
//  Budget.h
//  Budget Object
//
//  Created by apple on 9/11/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Budget : NSObject {
    float exchangeRate;
    double budget;
    double exchangeTransaction;
}
- (void) createBudget: (double) aBudget
     withExchangeRate: (float) anExchangeRate;
- (void) spendDollars: (double) dollars;
- (void) chargeForeignCurrency: (double) foreignCurrency;
@end