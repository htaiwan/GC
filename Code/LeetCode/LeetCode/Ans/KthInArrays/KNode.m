//
//  KNode.m
//  LeetCode
//
//  Created by Chien-Tai Cheng on 11/28/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "KNode.h"

@implementation KNode

- (instancetype) initWithValue:(NSInteger)value arrayId:(NSInteger)arrayId index:(NSInteger)index {
    if (self = [super init]) {
        _value = value;
        _arrayId = arrayId;
        _index = index;
    }

    return self;
}

@end
