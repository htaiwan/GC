//
//  MoveZero.m
//  LeetCode
//
//  Created by Chien-Tai Cheng on 11/28/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "MoveZero.h"

@implementation MoveZero

+ (NSMutableArray *)moveZero:(NSMutableArray *)list {
    int nonZeroIndex = 0;

    for (int i = 0; i < list.count; i++) {
        // find non-Zero nums, and move to the beginning of the array.
        if (((NSNumber *)list[i]).intValue != 0) {
            list[nonZeroIndex] = list[i];
            nonZeroIndex++;
        }
    }

    // Set the rest nums to 0 to keep the same array's length
    for (int i = nonZeroIndex + 1; i < list.count; i++) {
        list[i] = @(0);
    }

    return list;
}

@end
