//
//  Budget.m
//  Budget Object
//
//  Created by apple on 9/11/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "Budget.h"

@implementation Budget
- (void) createBudget:(double)aBudget withExchangeRate:(float)anExchangeRate {
    exchangeRate = anExchangeRate;
    budget = aBudget;
}
- (void) spendDollars:(double)dollars {
    budget -= dollars;
    NSLog(@"Converting %.2f US dollars into foreign currency leaves $%.2f", dollars, budget);
}
- (void) chargeForeignCurrency:(double)foreignCurrency {
    exchangeTransaction = foreignCurrency * exchangeRate;
    budget -= exchangeTransaction;
    NSLog(@"Charging %.2f in foreign currency leaves $%.2f", foreignCurrency, budget);
}
@end