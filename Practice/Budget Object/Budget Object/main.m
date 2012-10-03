//
//  main.m
//  Budget Object
//
//  Created by apple on 9/11/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Budget.h"

int main(int argc, const char * argv[])
{
//    double numberDollarsInEuroland = 100;
    double numberEuros = 100;
    double numberDollarsInPoundland = 100;
    double numberPounds = 100;
    
    Budget *europeBudget = [Budget new];
    
    NSNumber *europeDollarTransaction = [[NSNumber alloc] initWithDouble:100.00];
    NSNumber *europeDollarTransaction2 = [[NSNumber alloc] initWithDouble:200.00];
    
    NSMutableArray *europeDollarTransactions = [[NSMutableArray alloc] initWithCapacity:1];
    [europeDollarTransactions addObject:europeDollarTransaction];
    [europeDollarTransactions addObject:europeDollarTransaction2];
    
    for (NSNumber *aTransaction in europeDollarTransactions) {
        [europeBudget spendDollars:[aTransaction doubleValue]];
    }
        
    [europeBudget createBudget:1000.00 withExchangeRate:1.2500];
//    [europeBudget spendDollars:numberDollarsInEuroland];
    [europeBudget chargeForeignCurrency:numberEuros];
    
    Budget *englandBudget = [Budget new];
    [englandBudget createBudget:2000.00 withExchangeRate:1.5000];
    [englandBudget spendDollars:numberDollarsInPoundland];
    [englandBudget chargeForeignCurrency:numberPounds];
    
    return 0;
}