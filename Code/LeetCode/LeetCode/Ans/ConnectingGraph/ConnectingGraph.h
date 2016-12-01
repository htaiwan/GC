//
//  ConnectingGraph.h
//  LeetCode
//
//  Created by Chien-Tai Cheng on 12/1/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectingGraph : NSObject

- (instancetype)initWithGraph:(NSInteger)graph;

- (void)connectNode:(NSInteger)a b:(NSInteger)b;

- (BOOL)isConnected:(NSInteger)a b:(NSInteger)b;

@end
