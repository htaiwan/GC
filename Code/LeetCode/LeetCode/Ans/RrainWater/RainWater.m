//
//  RainWater.m
//  LeetCode
//
//  Created by Chien-Tai Cheng on 12/1/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "RainWater.h"

@implementation RainWater

+ (int)trapRainWater:(NSArray *)data {
    int result = 0;
    int left = 0;
    int right = (int)data.count - 1;
    int leftHeight = ((NSNumber *)data[left]).intValue;
    int rightHeight = ((NSNumber *)data[right]).intValue;

    if (left >= right) return result;

    while (left < right) {
        if (leftHeight < rightHeight) {
            left++;
            if (leftHeight > ((NSNumber *)data[left]).intValue) {
                result = result + leftHeight - ((NSNumber *)data[left]).intValue;
            } else {
                leftHeight = ((NSNumber *)data[left]).intValue;
            }
        } else {
            right--;
            if (rightHeight > ((NSNumber *)data[right]).intValue) {
                 result = result + rightHeight - ((NSNumber *)data[right]).intValue;
            } else {
                rightHeight = ((NSNumber *)data[right]).intValue;
            }
        }
    }

    return result;
}

@end
