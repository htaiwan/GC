//
//  CommonSuperview.m
//  iOS_FB
//
//  Created by Chien-Tai Cheng on 12/5/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "CommonSuperview.h"

@implementation CommonSuperview

+ (nullable UIView *)getCommonSuperView:(nullable UIView *)view1 view2:(nullable UIView *)view2 {
    if (!view1 || !view2) return nil;

    NSMutableArray *superViewsArray = [[NSMutableArray alloc] init];
    UIView *superView = view1;

    while (superView) {
        [superViewsArray addObject:superView];
        superView = superView.superview;
    }

    superView = view2;
    while (superView) {
        if ([superViewsArray containsObject:superView]) {
            break;
        }
        superView = superView.superview;
    }

    return superView;
}


@end
