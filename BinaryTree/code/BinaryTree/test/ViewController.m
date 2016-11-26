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

    [self test];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
