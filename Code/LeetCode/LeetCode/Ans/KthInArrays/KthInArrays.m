//
//  KthInArrays.m
//  LeetCode
//
//  Created by Chien-Tai Cheng on 11/28/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "KthInArrays.h"
#import "KNode.h"

@implementation KthInArrays

+ (NSInteger)KthLargestInArrays:(int)k arrays:(NSArray *)arrays {
    // init a queue with size k
    NSMutableArray *queue = [[NSMutableArray alloc] initWithCapacity:k];
    NSComparator comparator = ^NSComparisonResult(KNode* obj1, KNode* obj2) {
        NSComparisonResult result = NSOrderedSame;
        // KthLarges
        if (obj1.value < obj2.value) {
            result = NSOrderedDescending; // 兩個交換
        } else if (obj1.value > obj2.value) {
            result = NSOrderedAscending;
        }

        // KthSmalls
        //        if (obj1.value < obj2.value) {
        //            result = NSOrderedAscending;
        //        } else if (obj1.value > obj2.value) {
        //            result = NSOrderedDescending; // 兩個交換
        //        }

        return result;
    };

    [queue sortUsingComparator:comparator];

    // sort every array in arrays
    NSInteger n = arrays.count;
    NSInteger i;
    for (i = 0; i < n; i++) {
        NSArray *list = arrays[i];
        NSArray *sorted = [list sortedArrayUsingSelector:@selector(compare:)];
        if (sorted.count > 0) {
            // record information to node
            NSInteger arrayId = i;
            NSInteger index = sorted.count;
            NSInteger value = ((NSNumber *)sorted[sorted.count - 1]).integerValue;

            // add the current max value to the queue
            KNode *node = [[KNode alloc] initWithValue:value arrayId:arrayId index:index];
            [queue addObject:node];
        }
    }

    // if current queue size < k, than add new node to queue
    for (i = 0; i < k; i++) {
        KNode *temp = queue[i];
        [queue removeObject:temp];
        NSInteger arrayId = temp.arrayId;
        NSInteger index = temp.index;
        NSInteger value = temp.value;

        if (i == k - 1) return value;
        if (index > 0) {
            index--;
            value = ((NSNumber *)arrays[arrayId][index]).integerValue;
            KNode *node = [[KNode alloc] initWithValue:value arrayId:arrayId index:index];
            [queue addObject:node];
        }
    }
    
    return -1;
}


@end
