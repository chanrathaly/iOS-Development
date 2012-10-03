//
//  main.m
//  Vacation Budget
//
//  Created by apple on 9/10/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

//struct budget {
//    float exchangeRate;
//    double budget;
//    double exchangeTransaction;
//};

typedef struct {
    float exchangeRate; double budget;
    double exchangeTransaction;
} budget;
budget vacationBudgetEurope;
budget vacationBudgetEngland;

//union theBudget {
//    double budget;
//    long long amountIWantToSpend;
//} europeUnion;

struct theBudget {
    double budget;
    union {
        double euros;
        double pounds;
    };
};

void spendDollars (budget *theBudget, double dollars);
void chargeForeignCurrency(budget* theBudget, double foreignCurrency);

int main(int argc, const char * argv[])
{
    //    @autoreleasepool {
    //
    //        // insert code here...
    //        NSLog(@"Hello, World!");
    //
    //    }
    
    vacationBudgetEurope.exchangeRate = 1.2500;
    vacationBudgetEurope.budget = 1000.00;
    double numDollarsInEuroland = 100;
    
    spendDollars(&vacationBudgetEurope, numDollarsInEuroland);
    NSLog(@"Converting %.2f US dollars into euros leaves $%.2f", numDollarsInEuroland, vacationBudgetEurope.budget);
    
    chargeForeignCurrency(&vacationBudgetEurope, numDollarsInEuroland);
    NSLog(@"Charging %.2f euros leaves $%.2f", numDollarsInEuroland, vacationBudgetEurope.budget);
    
    vacationBudgetEngland.exchangeRate = 1.5000;
    vacationBudgetEngland.budget = 2000.00;
    double numDollarsInPoundLand = 100;
    double numPound = 100;
    
    spendDollars(&vacationBudgetEngland, numDollarsInPoundLand);
    NSLog(@"Converting %.2f US dollars into pounds leaves %.2f", numDollarsInPoundLand, vacationBudgetEngland.budget);
    
    chargeForeignCurrency(&vacationBudgetEngland, numPound);
    NSLog(@"Charging %.2f pounds leaves $%.2f", numPound, vacationBudgetEngland.budget);
    
    return 0;
}

void spendDollars (budget *theBudget, double dollars) {
    //vacationBudget.budget -= dollars;
//    theBudget.budget -= dollars;
    theBudget->budget -= dollars;
}

void chargeForeignCurrency(budget* theBudget, double foreignCurrency) {
    theBudget->exchangeTransaction = foreignCurrency*theBudget->exchangeRate;
    theBudget->budget -= theBudget->exchangeTransaction;
}