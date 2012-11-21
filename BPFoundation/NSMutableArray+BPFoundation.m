//
//  NSMutableArray+BPFoundation.m
//  BPFoundation
//
//  Created by Brian Partridge on 11/21/12.
//  Copyright (c) 2012 Brian Partridge. All rights reserved.
//

#import "NSMutableArray+BPFoundation.h"

@implementation NSMutableArray (BPFoundation)

- (void)bp_safeAddObject:(id)object {
    if (object == nil) {
        return;
    }

    [self addObject:object];
}

@end
