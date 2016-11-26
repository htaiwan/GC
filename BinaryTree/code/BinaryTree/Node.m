//
//  Node.m
//  test
//
//  Created by Chien-Tai Cheng on 11/26/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "Node.h"

@implementation Node

- (BOOL)isLeftChildOfParent {
    return self.parent.leftChild == self ? YES : NO;
}

@end
