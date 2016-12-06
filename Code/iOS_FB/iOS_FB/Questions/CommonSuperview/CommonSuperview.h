//
//  CommonSuperview.h
//  iOS_FB
//
//  Created by Chien-Tai Cheng on 12/5/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

/* How to detect a common superview. */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonSuperview : NSObject

+ (UIView *)getCommonSuperView:(UIView *)view1 view2:(UIView *)view2;

@end
