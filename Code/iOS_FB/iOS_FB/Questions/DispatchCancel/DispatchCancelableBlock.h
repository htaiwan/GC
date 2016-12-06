//
//  DispatchCancelableBlock.h
//  iOS_FB
//
//  Created by Chien-Tai Cheng on 12/5/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//


/*  iOS developers have a "dispatch_after(when, queue, block)" Grand Central Dispatch (GCD) function they can utilize but once it's set up, these calls can not be easily cancelled. Describe how you might implement a more convenient version of this named "cancellable_dispatch_after" */

#ifndef DispatchCancelableBlock_h
#define DispatchCancelableBlock_h
typedef void(^dispatch_after_with_cancel_t)(BOOL shouldCancel);

NS_INLINE dispatch_after_with_cancel_t dispatch_after_with_cancel(NSTimeInterval delay, dispatch_block_t block) {

    // First we have to create a new dispatch_cancelable_block_t and we also need to copy the block given
    __block dispatch_block_t originalBlock = [block copy];

    // This block will be executed in NOW() + delay
    __block dispatch_after_with_cancel_t cancelableBlock = ^(BOOL shouldCancel) {
        if (shouldCancel == NO && originalBlock) {
            originalBlock();
        }

        originalBlock = NULL;
    };

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        // We are now in the future (NOW() + delay). It means the block hasn't been canceled so we can execute it
        if (cancelableBlock) {
            cancelableBlock(NO);
            cancelableBlock = NULL;
        }
    });

    return cancelableBlock;
}

/**
 *  Cancels the block before it executes. Does nothing when a NULL block is
 *  provided.
 *
 *  @param block the block to cancel
 */
NS_INLINE void cancel_block(dispatch_after_with_cancel_t block) {
    if (block) {
        block(YES);
        block = NULL;
    }
}

#endif /* DispatchCancelableBlock_h */
