//
//  NSMutableDictionary+BPFoundation.h
//  BPFoundation
//
//  Created by Brian Partridge on 11/21/12.
//  Copyright (c) 2012 Brian Partridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (BPFoundation)

// Safely add the object to the dictionary. Silently fails if object or key is nil.
- (void)bp_safeSetObject:(id)object forKey:(id)key;

@end
