//
//  SearchViewConroller.m
//  iOS_FB
//
//  Created by Chien-Tai Cheng on 12/5/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "SearchViewConroller.h"
#import "ServerConn.h"
#import "DispatchCancelableBlock.h"

/* Pretend you're given a simple iOS app with a table view and a text field which looks like a search bar. 
 It has methods to call to a remote server to get potential auto complete words. 
 Describe how you would actually implement the iOS side. */

@interface SearchViewConroller ()

@property (nonatomic, strong) UITableView *resultTable;
@property (nonatomic, copy) NSArray *resultContents;

@property (nonatomic) BOOL cancelState;

@end

@implementation SearchViewConroller

- (void)textFieldDidChange:(UITextField *)searchField {
    self.resultContents = [ServerConn autocomplete: searchField.text];
    [self.resultTable reloadData];
}

//- (void)textFieldDidChange:(UITextField *)searchField {
//    // if we already had a cancelState object for a potentially running query, cancel it
//    if (self.cancelState) {
//        self.cancelState = YES;
//    }
//
//    // do the work asynchronously in the background
//    self.cancelState = cancellable_dispatch_after(0, GLOBAL_ASYNC_QUEUE, ^{
//        self.resultContents = [ServerConn autocompleteSearchField: text];
//        // once we have results from the server, update the UI on the main thread
//        dispatch_async(mainQueue, ^{
//            [self.tableView reloadData];
//        });
//    });
//}

@end
