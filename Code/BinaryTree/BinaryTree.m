//
//  BinaryTree.m
//  test
//
//  Created by Chien-Tai Cheng on 11/26/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "BinaryTree.h"

@implementation BinaryTree

- (BOOL)insertNode:(Node *)node parent:(Node *)parent isLeftChild:(BOOL)value {
    if (self.root == nil) {
        self.root = parent;
    }

    if (value == true && parent.leftChild == nil) {
        parent.leftChild = node;
    } else if (parent.rightChild == nil) {
        parent.rightChild = node;
    } else {
        NSAssert(parent.leftChild != nil || parent.rightChild != nil, @"Can't insert into parent node !!");
        return false;
    }

    return true;
}
- (Node *)find:(NSObject *)object {
    NSMutableArray *queue = [[NSMutableArray alloc] init];
    [queue addObject:self.root];

    Node *node;

    while (queue.count != 0) {
        node = [queue firstObject];
        [queue removeObject:[queue firstObject]];
        if ([node.object isEqual:object]) {
            return node;
        }
        if (node.leftChild) {
            [queue addObject:node.leftChild];
        }
        if (node.rightChild) {
            [queue addObject:node.rightChild];
        }
    }

    return nil;
}

- (void)preOrderTraversal {
    if (self.root) {
        [BinaryTree preOrderTraversalRecursive:self.root];
    }
}

- (void)inOrderTraversal {
    if (self.root) {
        [BinaryTree inOrderTraversalRecursive:self.root];
    }
}

- (void)postOrderTraversal {
    if (self.root) {
        [BinaryTree postOrderTraversalRecursive:self.root];
    }
}

- (void)levelOrderTraversal {
    if (self.root) {
        NSMutableArray *queue = [[NSMutableArray alloc] init];
        [queue addObject:self.root];

        while (queue.count != 0) {
            Node *currentNode = [queue firstObject];
            [queue removeObject:[queue firstObject]];
            if (currentNode.leftChild) {
                [queue addObject:currentNode.leftChild];
            }
            if (currentNode.rightChild) {
                [queue addObject:currentNode.rightChild];
            }
            NSLog(@"%@", currentNode.object);
        }
    }
}

+ (void)preOrderTraversalRecursive:(Node *)node {
    if (node) {
        NSLog(@"%@", node.object);
        [BinaryTree preOrderTraversalRecursive:node.leftChild];
        [BinaryTree preOrderTraversalRecursive:node.rightChild];
    }
}

+ (void)inOrderTraversalRecursive:(Node *)node {
    if (node) {
        [BinaryTree inOrderTraversalRecursive:node.leftChild];
        NSLog(@"%@",node.object);
        [BinaryTree inOrderTraversalRecursive:node.rightChild];
    }
}

+ (void)postOrderTraversalRecursive:(Node *)node {
    if (node) {
        [BinaryTree postOrderTraversalRecursive:node.leftChild];
        [BinaryTree postOrderTraversalRecursive:node.rightChild];
        NSLog(@"%@",node.object);
    }
}

- (BOOL)isEqual:(BinaryTree *)tree {
    return [self isNodeEqual:self.root b:tree.root];
}

- (BOOL)isNodeEqual:(Node *)a b:(Node *)b {
    if ([a.object isEqual:b.object]) {
        [self isNodeEqual:a.leftChild b:b.leftChild];
        [self isNodeEqual:a.rightChild b:b.rightChild];
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isBinarySearchTree {
    return [self isBSTUtil:self.root max:INT_MAX min:INT_MIN];
}

- (BOOL)isBSTUtil:(Node *)node max:(int)max min:(int)min {
    BOOL result = YES;
    // an empty tree is BST
    if (node == nil) {
        result = YES;
    }
    // check object
    if ([node.object isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)node.object;
        if (number.intValue < min || number.intValue > max) {
            result = NO;
        } else {
            BOOL result1 = YES;
            BOOL result2 = YES;
            if (node.leftChild) {
               result1 = [self isBSTUtil:node.leftChild max:number.intValue - 1 min:min];
            }
            if (node.rightChild) {
                result2 =[self isBSTUtil:node.rightChild max:max min:number.intValue + 1];
            }
            result = result1 && result2;
        }
    } else {
        result = NO;
    }

    return result;
}

@end
