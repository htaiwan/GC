//
//  SlidingWindowMaximum.m
//  LeetCode
//
//  Created by Chien-Tai Cheng on 12/2/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "SlidingWindowMaximum.h"

@implementation SlidingWindowMaximum

+ (NSMutableArray *)getSlidingWindowMaximum:(NSArray *)data interval:(int)interval {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    NSMutableArray *sort = [[NSMutableArray alloc] init];

    int count = 0;
    for (int i = 1; i <= data.count; i++) {
        if (i + interval > data.count) return result;
        if (count == interval) {

        } else {
            count++;
            [temp addObject:data[i]];
        }
    }
}

@end
