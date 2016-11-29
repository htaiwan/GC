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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self testMoveZero];
//    [self testKthInArrays];
    [self testTwoSum];
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


@end
