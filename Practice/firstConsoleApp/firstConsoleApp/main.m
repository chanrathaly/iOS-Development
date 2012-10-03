//
//  main.m
//  firstConsoleApp
//
//  Created by apple on 9/5/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        /* Block String */
//        NSString * song = @"Let Forever Be,The Chemical, Brothers";
//        NSRange range = [song rangeOfString:@"l,"];
//        printf("comma location: %i\nrange.length=%i\n", (int)range.location, (int)range.length);
//        NSString * title = [song substringToIndex:range.location];
//        NSString * artist = [song substringFromIndex:range.location + range.length];
//        NSLog(@"%@", title);
//        NSLog(@"%@", artist);
        //        NSMutableString * song = [[NSMutableString alloc] init];
        //        [song appendString:@"Deaf Leppard"];
        //        printf("%s\n", [song UTF8String]);
        //        NSRange range = [song rangeOfString:@"Deaf"];
        //        [song replaceCharactersInRange:range withString:@"Def"];
        //        printf("%s\n", [song UTF8String]);
        //        [song insertString:@"Animal by " atIndex:0];
        //        printf("%s\n", [song UTF8String]);
        
        /* Block File / Directory */
        NSString * filename = @"/Users/apple/Documents/Development/ObjectiveC/Practice/firstConsoleApp/firstConsoleApp/main.m";
        filename = [filename stringByStandardizingPath];
        NSLog(@"%@", filename);
//        NSString * source = [NSString stringWithContentsOfFile:filename];
        NSString * source = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:nil];
        printf("%s\n", [source UTF8String]);
    }
    return 0;
}