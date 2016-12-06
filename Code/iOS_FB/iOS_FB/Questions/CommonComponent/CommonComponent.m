//
//  CommonComponent.m
//  iOS_FB
//
//  Created by Chien-Tai Cheng on 12/6/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "CommonComponent.h"

@interface CommonComponent()

@end

@implementation CommonComponent

+ (NSMutableArray *)recordIndexPaths:(NSMutableArray *)indexPaths view:(UIView *)originalView {
    if (!originalView.superview) {
        UIView *parent = originalView.superview;
        NSInteger index = [parent.subviews indexOfObject:originalView];
        [indexPaths insertObject:@(index) atIndex:0];
        [self recordIndexPaths:indexPaths view:parent];
    }

    return indexPaths;
}

+ (UIView *)findView:(NSArray *)indexPaths forIndex:(int)i forView:(UIView *)cloneView {
    if (!cloneView.subviews.count) {
        return cloneView;
    }

    NSInteger index = ((NSNumber *)indexPaths[i]).integerValue;
    UIView *child = cloneView.subviews[index];

    return [self findView:indexPaths forIndex:i+1 forView:child];
}

@end
