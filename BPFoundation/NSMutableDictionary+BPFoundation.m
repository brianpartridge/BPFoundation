//
//  NSMutableDictionary+BPFoundation.m
//  BPFoundation
//
//  Created by Brian Partridge on 11/21/12.
//  Copyright (c) 2012 Brian Partridge. All rights reserved.
//

#import "NSMutableDictionary+BPFoundation.h"

@implementation NSMutableDictionary (BPFoundation)

- (void)bp_safeSetObject:(id)object forKey:(id)key {
    if (object == nil ||
        key == nil) {
        return;
    }

    [self setObject:object forKey:key];
}

@end
