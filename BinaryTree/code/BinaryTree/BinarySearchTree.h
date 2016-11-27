//
//  BinarySearchTree.h
//  test
//
//  Created by Chien-Tai Cheng on 11/27/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface BinarySearchTree : NSObject

@property (nonatomic, strong) Node *root;
- (instancetype)initWithObject:(NSObject *)object compareSelector:(SEL)selector;
- (void)insertObject:(NSObject *)object;
- (Node *)find:(NSObject *)object;
- (Node *)deleteObject:(NSObject *)object;
@end
