//
//  ViewController.m
//  LeetCode
//
//  Created by Chien-Tai Cheng on 11/28/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "ViewController.h"
#import "MoveZero.h"
#import "KthInArrays.h"
#import "TwoSum.h"
#import "ConnectingGraph.h"
#import "RainWater.h"
#import "DataStreamMedian.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self testMoveZero];
//    [self testKthInArrays];
//    [self testTwoSum];
//    [self testConnectingGraph];
//    [self testTrappingRainWater];
    [self testDataStreamMedian];
}


- (void)testMoveZero {
    // test data
    NSMutableArray *data = [[NSMutableArray alloc] initWithObjects:@1,@3,@0,@9,@0,@7,@0,nil];
    NSLog(@"%@", [MoveZero moveZero:data]);
}

- (void)testKthInArrays {
    // test data
    NSArray *data = @[@[@2,@3,@5,@1,@3],
                @[@1,@10],
                @[@3,@5,@9,@8]];

    NSLog(@"%@", @([KthInArrays KthLargestInArrays:3 arrays:data]));
}

- (void)testTwoSum {
    // test data
    NSArray *data = @[@5,@3,@2,@1,@9,@7];

    NSLog(@"%@", [TwoSum twoSum:7 list:data]);
}

- (void)testConnectingGraph {
    ConnectingGraph *graph = [[ConnectingGraph alloc] initWithGraph:5];
    NSLog(@"%@", @([graph isConnected:1 b:2]));
    [graph connectNode:1 b:2];
    NSLog(@"%@", @([graph isConnected:1 b:3]));
    [graph connectNode:2 b:4];
    NSLog(@"%@", @([graph isConnected:1 b:4]));
}

- (void)testTrappingRainWater {
    // test data
    NSArray *data = @[@0,@1,@0,@2,@1,@0,@1,@3,@2,@1,@2,@1];
    NSLog(@"%@",@([RainWater trapRainWater:data]));
}

- (void)testDataStreamMedian {
    // test data
//    NSArray *data = @[@4, @5, @1, @3, @2, @6, @0];
    NSArray *data = @[@2,@20,@100];
    NSLog(@"%@",[DataStreamMedian getDataStreamMedian:data]);
}


@end
