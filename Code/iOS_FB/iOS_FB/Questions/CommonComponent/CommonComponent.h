//
//  CommonComponent.h
//  iOS_FB
//
//  Created by Chien-Tai Cheng on 12/6/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonComponent : NSObject

+ (NSMutableArray *)recordIndexPaths:(NSMutableArray *)indexPaths view:(UIView *)originalView;
+ (UIView *)findView:(NSArray *)indexPaths forIndex:(int)i forView:(UIView *)cloneView;

@end
