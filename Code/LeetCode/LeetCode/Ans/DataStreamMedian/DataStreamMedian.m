//
//  DataStreamMedian.m
//  LeetCode
//
//  Created by Chien-Tai Cheng on 12/1/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "DataStreamMedian.h"

@implementation DataStreamMedian

+ (NSMutableArray *)getDataStreamMedian:(NSArray *)data {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSMutableArray *temp = [[NSMutableArray alloc] init];

    for (int i = 0 ; i <= data.count - 1; i++) {
        [temp addObject:data[i]];
        [temp sortUsingSelector:@selector(compare:)];

        int index;
        if (temp.count % 2 == 0) {
            index = ((int)temp.count / 2) - 1;
        } else {
            index = (((int)temp.count - 1)/2 + 1) - 1;
        }
        [result addObject:temp[index]];
    }

    return result;
}
@end
