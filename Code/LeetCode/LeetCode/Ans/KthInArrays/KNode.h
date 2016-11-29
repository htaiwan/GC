//
//  KNode.h
//  LeetCode
//
//  Created by Chien-Tai Cheng on 11/28/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KNode : NSObject

@property (nonatomic, assign) NSInteger value;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger arrayId;

- (instancetype) initWithValue:(NSInteger)value arrayId:(NSInteger)arrayId index:(NSInteger)index;

@end
