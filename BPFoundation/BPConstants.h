//
//  BPConstants.h
//  BPFoundation
//
//  Created by Brian Partridge on 11/21/12.
//  Copyright (c) 2012 Brian Partridge. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const BPFoundationErrorDomain;

typedef NS_ENUM(NSInteger, BPFoundationError) {
    BPFoundationErrorUnexpectedJSONFieldType,
    BPFoundationErrorUnknown,
};
