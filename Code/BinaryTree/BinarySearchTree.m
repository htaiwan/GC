//
//  BinarySearchTree.m
//  test
//
//  Created by Chien-Tai Cheng on 11/27/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "BinarySearchTree.h"

@implementation BinarySearchTree

- (instancetype)initWithObject:(NSObject *)object compareSelector:(SEL)selector {
    if (self = [super init]) {
        _root = [[Node alloc] init];
        self.root.object = object;
        self.root.compareSelector = selector;
    }

    return self;
}

- (void)insertObject:(NSObject *)object {
    Node *treeNode = [[Node alloc] init];
    treeNode.object = object;
    treeNode.compareSelector = self.root.compareSelector;

    Node *currentNode = self.root;
    Node *parentNode = self.root;

    while (YES) {
        NSComparisonResult result = (NSComparisonResult)[object performSelector:currentNode.compareSelector withObject:currentNode.object];
        if (result >= 0) {
            if (!currentNode.rightChild) {
                currentNode.rightChild = treeNode;
                treeNode.parent = parentNode;
                break;
            } else {
                currentNode = currentNode.rightChild;
                parentNode = currentNode;
            }
        } else {
            if (!currentNode.leftChild) {
                currentNode.leftChild = treeNode;
                treeNode.parent = parentNode;
                break;
            } else {
                currentNode = currentNode.leftChild;
                parentNode = currentNode;
            }
        }
    }
}

- (Node *)find:(NSObject *)object {
    Node *currentNode = self.root;
    while (YES) {
        NSComparisonResult result = (NSComparisonResult)[object performSelector:currentNode.compareSelector withObject:currentNode.object];
        if (result > 0) {
            if (currentNode.rightChild) {
                currentNode = currentNode.rightChild;
            } else {
                return nil;
            }
        } else if (result < 0){
            if (currentNode.leftChild) {
                currentNode = currentNode.rightChild;
            } else {
                return nil;
            }
        } else {
            return nil;
        }
    }

    return currentNode;
}


@end
