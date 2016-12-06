//
//  ViewController.m
//  iOS_FB
//
//  Created by Chien-Tai Cheng on 12/5/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "ViewController.h"
#import "DispatchCancelableBlock.h"
#import "CommonSuperview.h"
#import "UniqueDictionary.h"
#import "CommonComponent.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view4;

@property (weak, nonatomic) IBOutlet UIView *viewA;
@property (weak, nonatomic) IBOutlet UIView *cloneB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self testDispatchAfterWithCancel];
//    [self testCommonSuperview];
//    [self testUniqueArray];
    [self testCommonComponent];
}

- (void)testDispatchAfterWithCancel {
    dispatch_after_with_cancel_t block = dispatch_after_with_cancel(3, ^{
        NSLog(@"Hello world!");
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"Canceling block early");
        cancel_block(block);
    });
}


- (void)testCommonSuperview {
    NSLog(@"%@", [CommonSuperview getCommonSuperView:self.view2 view2:self.view4]);
}

- (void)testUniqueArray {
    NSArray *testData = @[@"one", @"two", @"three", @"dog", @"cat", @"one", @"fox", @"dog", @"One", @"one"];
    NSLog(@"%@", [UniqueDictionary UniqueArray:testData]);
}

- (void)testCommonComponent {
    NSMutableArray *recordArray = [[NSMutableArray alloc] init];
    recordArray = [CommonComponent recordIndexPaths:recordArray view:self.viewA];

    NSLog(@"%@", [CommonComponent findView:recordArray forIndex:0 forView:self.cloneB]);
}


@end
