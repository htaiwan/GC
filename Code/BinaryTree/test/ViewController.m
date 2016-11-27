//
//  ViewController.m
//  test
//
//  Created by Chien-Tai Cheng on 11/26/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "ViewController.h"
#import "Node.h"
#import "BinaryTree.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    [self test];
//    [self testEqual];
    [self testBinaryTree];
}

- (void)test {
    // test data
    NSArray *data = @[@"A", @"B", @"C", @"D", @"E", @"F"];

    // build binary tree
    BinaryTree *tree = [self buildBinaryTree:data];

    // test inOrder
    [tree inOrderTraversal];
}

- (BinaryTree *)buildBinaryTree:(NSArray *)data {
    BinaryTree *tree = [[BinaryTree alloc] init];
    NSMutableArray *queue = [[NSMutableArray alloc] init];

    Node *node = [[Node alloc] init];
    node.object = data.firstObject;
    [queue addObject:node];

    for (int i  = 1; i < data.count; i++) {
        Node *node = [[Node alloc] init];
        node.object = data[i];

        Node *parent = [queue firstObject];
        if (parent.leftChild != nil && parent.rightChild != nil) {
            [queue removeObject:[queue firstObject]];
            parent = [queue firstObject];
        }

        if (parent.leftChild == nil) {
            [tree insertNode:node parent:parent isLeftChild:YES];
        } else if (parent.leftChild != nil && parent.rightChild == nil) {
            [tree insertNode:node parent:parent isLeftChild:NO];
        }

        [queue addObject:node];
    }

    return tree;
}

- (void)testEqual {
    // test data
    NSArray *data1 = @[@"A", @"B", @"C", @"D", @"E", @"F"];
    NSArray *data2 = @[@"B", @"A", @"D", @"C", @"E", @"F"];
    NSArray *data3 = @[@"A", @"B", @"C", @"D", @"E", @"F"];
    NSArray *data4 = @[@"B", @"A", @"D", @"C", @"E", @"F"];


    BinaryTree *tree1 = [self buildBinaryTree:data1];
    BinaryTree *tree2 = [self buildBinaryTree:data2];
    BinaryTree *tree3 = [self buildBinaryTree:data3];
    BinaryTree *tree4 = [self buildBinaryTree:data4];


    NSLog(@"1.%i",[tree1 isEqual:tree2]);
    NSLog(@"2.%i",[tree1 isEqual:tree3]);
    NSLog(@"3.%i",[tree2 isEqual:tree4]);
}

- (void)testBinaryTree {
    // test data
    NSArray *data1 = @[@(6), @(4), @(8), @(3), @(5), @(7), @(10)];
    NSArray *data2 = @[@(1), @(2), @(3), @(4), @(5), @(6), @(7)];

    BinaryTree *tree1 = [self buildBinaryTree:data1];
    BinaryTree *tree2 = [self buildBinaryTree:data2];

    NSLog(@"1.%i",[tree1 isBinarySearchTree]);
    NSLog(@"2.%i",[tree2 isBinarySearchTree]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
