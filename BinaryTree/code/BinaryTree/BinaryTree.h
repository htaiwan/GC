//
//  BinaryTree.h
//  test
//
//  Created by Chien-Tai Cheng on 11/26/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface BinaryTree : NSObject

@property (nonatomic, strong) Node *root;

- (BOOL)insertNode:(Node *)node parent:(Node *)parent isLeftChild:(BOOL)value;
- (Node *)find:(NSObject *)object;

- (void)preOrderTraversal;
- (void)inOrderTraversal;
- (void)postOrderTraversal;
- (void)levelOrderTraversal;

@end
