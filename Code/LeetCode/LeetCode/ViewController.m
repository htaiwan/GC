//
//  ViewController.m
//  LeetCode
//
//  Created by Chien-Tai Cheng on 11/28/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "ViewController.h"
#import "MoveZero.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self testMoveZero];
}


- (void)testMoveZero {
    // test data
    NSMutableArray *list = [[NSMutableArray alloc] initWithObjects:@(1),@(3),@(0),@(9),@(0),@(7),@(0),nil];
    NSLog(@"%@", [MoveZero moveZero:list]);
}


@end
