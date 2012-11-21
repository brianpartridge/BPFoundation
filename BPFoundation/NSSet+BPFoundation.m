//
//  NSSet+BPFoundation.m
//  BPFoundation
//
//  Created by Brian Partridge on 2/29/12.
//  Copyright (c) 2012 Brian Partridge. All rights reserved.
//

#import "NSSet+BPFoundation.h"

@implementation NSSet (BPFoundation)

- (NSSet *)bp_objectsNotInSet:(NSSet *)set {
    NSMutableSet *mutableSelf = [self mutableCopy];
    [mutableSelf minusSet:set];
    return [mutableSelf copy];
}

+ (NSSet *)bp_intersectionOfSet:(NSSet *)firstSet withSet:(NSSet *)secondSet {
    NSMutableSet *result = [firstSet mutableCopy];
    [result intersectSet:secondSet];
    return [result copy];
}

@end
