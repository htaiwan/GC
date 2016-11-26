//
//  Node.h
//  test
//
//  Created by Chien-Tai Cheng on 11/26/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic, strong) NSObject *object;
@property (nonatomic, strong) Node *parent;
@property (nonatomic, strong) Node *leftChild;
@property (nonatomic, strong) Node *rightChild;

- (BOOL)isLeftChildOfParent;

@end
