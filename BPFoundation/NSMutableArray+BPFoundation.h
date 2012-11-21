//
//  NSMutableArray+BPFoundation.h
//  BPFoundation
//
//  Created by Brian Partridge on 11/21/12.
//  Copyright (c) 2012 Brian Partridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (BPFoundation)

// Safely add the object to the array.  Silently fails if object is nil.
- (void)bp_safeAddObject:(id)object;

@end
