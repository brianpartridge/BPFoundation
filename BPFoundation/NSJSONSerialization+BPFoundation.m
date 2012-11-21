//
//  NSJSONSerialization+BPFoundation.m
//  LampPost
//
//  Created by Brian Partridge on 2/11/12.
//  Copyright (c) 2012 Brian Partridge. All rights reserved.
//

#import "NSJSONSerialization+BPFoundation.h"
#import "BPConstants.h"
#import "BPGeometry.h"

@interface NSJSONSerialization (BPFoundation_Private)

+ (id)bp_JSONObjectOfClass:(Class)class WithData:(NSData *)data options:(NSJSONReadingOptions)options error:(NSError **)error;

@end

@implementation NSJSONSerialization (BPFoundation)

+ (id)bp_JSONObjectOfClass:(Class)class WithData:(NSData *)data options:(NSJSONReadingOptions)options error:(NSError **)error {
    id result = nil;
    
    id object = [NSJSONSerialization JSONObjectWithData:data options:options error:error];
    if (*error == nil) {
        if ([object isKindOfClass:class]) {
            result = object;
        } else {
            NSString *expectedClassName = NSStringFromClass(class);
            NSString *actualClassName = NSStringFromClass([object class]);
            NSString *description = [NSString stringWithFormat:@"Unexpected JSON field type. Expected '%@'. Actual '%@'.", expectedClassName, actualClassName];
            *error = [NSError errorWithDomain:BPFoundationErrorDomain
                                         code:BPFoundationErrorUnexpectedJSONFieldType
                                     userInfo:@{ NSLocalizedDescriptionKey : description }];
        }
    }
    
    return result;
}

+ (NSArray *)bp_JSONArrayWithData:(NSData *)data options:(NSJSONReadingOptions)options error:(NSError **)error {
    return [NSJSONSerialization bp_JSONObjectOfClass:[NSArray class] WithData:data options:options error:error];
}

+ (NSDictionary *)bp_JSONDictionaryWithData:(NSData *)data options:(NSJSONReadingOptions)options error:(NSError **)error {
    return [NSJSONSerialization bp_JSONObjectOfClass:[NSDictionary class] WithData:data options:options error:error];
}

@end
