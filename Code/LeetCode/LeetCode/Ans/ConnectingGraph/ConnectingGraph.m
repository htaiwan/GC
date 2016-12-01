//
//  ConnectingGraph.m
//  LeetCode
//
//  Created by Chien-Tai Cheng on 12/1/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "ConnectingGraph.h"

@interface ConnectingGraph()
@property (nonatomic, strong) NSMutableArray *father;
@end

@implementation ConnectingGraph

// init array with size n+1
- (instancetype)initWithGraph:(NSInteger)graph {
    if (self = [super init]) {
        self.father = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i <= graph; i++) {
            // assign 0 to all index, which means there is connected edge
            [self.father addObject:@(0)];
        }
    }
    return self;
}

- (void)connectNode:(NSInteger)a b:(NSInteger)b {
    NSInteger fatehrA = [self find:a];
    NSInteger fatehrB = [self find:b];
    // if we can not find same other, then we can connected the 2 nodes
    if (fatehrA != fatehrB) {
        self.father[fatehrA] = @(fatehrB);
    }
}

- (BOOL)isConnected:(NSInteger)a b:(NSInteger)b {
    NSInteger fatehrA = [self find:a];
    NSInteger fatehrB = [self find:b];

    // check if having same father or not
    return fatehrA == fatehrB;
}

- (NSInteger)find:(NSInteger)x {
    NSInteger father = [self convert:self.father[x]];
    // if there is no father exist
    if (father == 0) {
        return x;
    }

    // recursive to find father x
    return [self find:father];
}

- (NSInteger)convert:(NSObject *)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return ((NSNumber *)object).integerValue;
    }

    return -1;
}

@end
