//
//  BPBonjourBrowser.h
//  BPFoundation
//
//  Created by Brian Partridge on 2/27/13.
//  Copyright (c) 2013 Brian Partridge. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BPBonjourBrowserServicesBlock)(NSArray *services);

#pragma mark -  Common Bonjour Domain Definitions
extern NSString * const kBPBonjourBrowserDomainLocal;

#pragma mark -  Common Bonjour Service Type Definitions
extern NSString * const kBPBonjourBrowserServiceTypeHTTP;
extern NSString * const kBPBonjourBrowserServiceTypeFTP;

/**
 Block-based wrapper around NSNetServiceBrowser
 */
@interface BPBonjourBrowser : NSObject

/**
 Searches for the specified Bonjour services types and returns the found services via updateBlock.
 Updates may be triggered multiple times, as new services are discovered or removed.
 */
- (void)searchForServicesOfType:(NSString *)serviceType inDomain:(NSString *)domain updateBlock:(BPBonjourBrowserServicesBlock)updateBlock;

/**
 Stops any running searches and releases the the update block.
 */
- (void)stopSearching;

@end
