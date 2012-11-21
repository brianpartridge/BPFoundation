//
//  NSBundle+BPFoundation.h
//  BPFoundation
//
//  Created by Brian Partridge on 3/2/12.
//  Copyright (c) 2012 Brian Partridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (BPFoundation)

// Bundle name : CFBundleNameKey
- (NSString *)bp_name;

// Bundle version : CFBundleShortVersionString
- (NSString *)bp_version;

// Bundle build number : CFBundleVersionKey
- (NSString *)bp_build;

// A properly formatted version for display.
- (NSString *)bp_formattedVersion;

// Helper to access the info dictionary.
- (id)bp_infoObjectForKey:(id)key;

@end
