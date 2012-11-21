//
//  NSURL+BPFoundation.h
//  BPFoundation
//
//  Created by Brian Partridge on 9/18/11.
//  Copyright 2011 Brian Partridge. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSURL (NSURL_BPFoundation)

#pragma mark - Helpers

// Returns a new URL with the base URL and query componenets.
+ (NSURL *)bp_urlWithString:(NSString *)urlString queryComponents:(NSDictionary *)queryComponents;

// Truncates URL components after the path.
- (NSString *)bp_urlStringByTrimmingQueryAndFragment;

// Extracts the query from the URL and parses it into a dictionary.
- (NSDictionary *)bp_queryComponents;

@end
