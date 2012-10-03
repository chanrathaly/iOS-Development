//
//  main.m
//  testArray
//
//  Created by apple on 9/12/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

//    @autoreleasepool {
//        
//        // insert code here...
//        NSLog(@"Hello, World!");
//        
//    }
    int twoDArray[3][3] = {{1,2,3},{4,5,6},{7,8,9}};
    NSLog(@"twoDArray[2][2] is %i", twoDArray[2][2]);
    
    NSArray *array1 = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithInt:1], [[NSNumber alloc] initWithInt:2], [[NSNumber alloc] initWithInt:3], nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithInt:4], [[NSNumber alloc] initWithInt:5], [[NSNumber alloc] initWithInt:6], nil];
    NSArray *array3 = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithInt:7], [[NSNumber alloc] initWithInt:8], [[NSNumber alloc] initWithInt:9], nil];
    
    NSArray *arrayOfArrays = [[NSArray alloc] initWithObjects:array1, array2, array3, nil];
    NSLog(@"NSArray of NSArrays equivalent is %i", [[[arrayOfArrays objectAtIndex:2] objectAtIndex:2] intValue]);
    
    NSArray *myColors = [NSArray arrayWithObjects:@"Blue", @"Red", @"Yellow", nil];
    NSLog(@"Number of element in array = %lu", [myColors count]);
    
    int i, myColorCound = [myColors count];
    for (i=0; i<myColorCound; i++) {
        NSLog(@"Color element %i = %@", i, [myColors objectAtIndex:i]);
    }
    
    for (NSString *color in myColors)
        NSLog(@"Element of color = %@", color);
    
    NSMutableArray *myNewColors = [NSMutableArray arrayWithObjects:@"Red", @"Blue", nil];
    [myNewColors addObject:@"Green"];
    [myNewColors insertObject:@"Pink" atIndex:0];
    
    for (NSString *newColor in myNewColors)
        NSLog(@"Element of new color = %@", newColor);
    
    return 0;
}

