//
//  NSString+BPFoundation.h
//  BPFoundation
//
//  Created by Brian Partridge on 9/18/11.
//  Copyright 2011 Brian Partridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BPFoundation)

#pragma mark - Helpers

// Simple check for invalid strings.
+ (BOOL)bp_isNilOrEmpty:(NSString *)aString;

// Trim whitespace and newlines from the current instance.
- (NSString *)bp_trimmedString;

// Parses a hex string (0xABCDEF or #ABCDEF) into a numeric value.
- (int)bp_hexValue;

// Returns the last component of this string separated by componentSeparators.
- (NSString *)bp_lastComponent:(NSCharacterSet *)componentSeparators;

// Returns a copy of this string with the last component truncated.
- (NSString *)bp_stringByRemovingLastComponent:(NSCharacterSet *)componentSeparators;

#pragma mark - URL Encoding

// These methods are taken directly from MKNetworkKit. Big Thanks!
- (NSString *)bp_urlEncodedString;
- (NSString *)bp_urlDecodedString;

#pragma mark - Searching

// Check whether the substring is contained within the current instance.
- (BOOL)bp_containsString:(NSString*)aString caseSensitive:(BOOL)caseSensitive;


@end
