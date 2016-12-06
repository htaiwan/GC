//
//  UniqueDictionary.m
//  iOS_FB
//
//  Created by Chien-Tai Cheng on 12/6/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "UniqueDictionary.h"

@implementation UniqueDictionary

+ (NSArray *)UniqueArray:(NSArray *)array {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    for (NSString *string in array) {
        NSNumber *number = [dict objectForKey:string];
        if (number) {
            // if find the same string, jsut update the value
            number = [NSNumber numberWithInteger:number.integerValue + 1];
        } else {
            // find new string
            number = [NSNumber numberWithInteger:1];
        }
        [dict setObject:number forKey:string];
    }

    return ([dict allKeys]);
}

@end
