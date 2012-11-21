//
//  NSSet+BPFoundation.h
//  BPFoundation
//
//  Created by Brian Partridge on 2/29/12.
//  Copyright (c) 2012 Brian Partridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (BPFoundation)

// Returns the set of objects in this set, but not in the input set.
- (NSSet *)bp_objectsNotInSet:(NSSet *)set;

// Returns a new set containg only the objects common to firstSet and secondSet.
+ (NSSet *)bp_intersectionOfSet:(NSSet *)firstSet withSet:(NSSet *)secondSet;

@end
