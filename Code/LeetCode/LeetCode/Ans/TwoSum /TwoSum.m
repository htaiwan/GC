//
//  TwoSum.m
//  LeetCode
//
//  Created by Chien-Tai Cheng on 11/29/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "TwoSum.h"
#import "KNode.h"

@implementation TwoSum

+ (NSArray *)twoSum:(int)target list:(NSArray *)list {
    NSMutableArray *queue = [[NSMutableArray alloc] init];

    for (NSInteger i = 0; i < list.count; i++) {
        // using node structure to record value & index O(n)
        NSInteger value = ((NSNumber *)list[i]).integerValue;
        KNode *node = [[KNode alloc] initWithValue:value arrayId:0 index:i];
        [queue addObject:node];
    }

    // sort node in the queue O(nlogn);
    [queue sortUsingComparator:^NSComparisonResult(KNode *node1, KNode *node2) {
        NSComparisonResult result = NSOrderedSame;
        if (node1.value < node2.value) {
            result = NSOrderedAscending;
        } else if (node1.value > node2.value) {
            result = NSOrderedDescending;
        }
        return result;
    }];

    // using two pointer i,j to scan the queue O(n)
    for (NSInteger j = queue.count - 1; j >= 0; j--) {
        KNode *node1 = queue[j];
        NSInteger n1 = node1.value;
        if (n1 <= target) {
            for (NSInteger i = j - 1; i >= 0; i--) {
                KNode *node2 = queue[i];
                NSInteger n2 = node2.value;
                if (n2 == (target - n1)) {
                    NSArray *result = @[@(node1.index + 1), @(node2.index + 1)];
                    // compare the two node index O(1)
                    [result sortedArrayUsingSelector:@selector(compare:)];
                    return result;
                }
            }
        }
    }

    return @[];
}

@end
