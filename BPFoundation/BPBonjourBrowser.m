//
//  BPBonjourBrowser.m
//  BPFoundation
//
//  Created by Brian Partridge on 2/27/13.
//  Copyright (c) 2013 Brian Partridge. All rights reserved.
//

#import "BPBonjourBrowser.h"

NSString * const kBPBonjourBrowserDomainLocal = @"local.";
NSString * const kBPBonjourBrowserServiceTypeHTTP = @"_http._tcp.";
NSString * const kBPBonjourBrowserServiceTypeFTP = @"_ftp._tcp.";

@interface BPBonjourBrowser () <NSNetServiceBrowserDelegate>

@property (nonatomic, strong) NSNetServiceBrowser *browser;

@property (nonatomic, strong) NSMutableArray *foundServices;
@property (nonatomic, copy) BPBonjourBrowserServicesBlock batchUpdateBlock;

@end

@implementation BPBonjourBrowser

- (NSNetServiceBrowser *)browser {
    if (_browser == nil) {
        _browser = [[NSNetServiceBrowser alloc] init];
        _browser.delegate = self;
    }

    return _browser;
}

#pragma mark - Public Methods

- (void)searchForServicesOfType:(NSString *)serviceType inDomain:(NSString *)domain updateBlock:(BPBonjourBrowserServicesBlock)updateBlock {
    [self stopSearching];
    self.batchUpdateBlock = updateBlock;
    [self.browser searchForServicesOfType:serviceType inDomain:domain];
}

- (void)stopSearching {
    self.foundServices = nil;
    self.batchUpdateBlock = nil;
    [self.browser stop];
}

#pragma mark - Helpers

- (void)sendBatchUpdate {
    if (self.batchUpdateBlock != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.batchUpdateBlock(self.foundServices);
        });
    }
}

#pragma mark - NSNetServiceBrowserDelegate

- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didFindService:(NSNetService *)aNetService moreComing:(BOOL)moreComing {
    [self.foundServices addObject:aNetService];
    if (!moreComing) {
        [self sendBatchUpdate];
    }
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didRemoveService:(NSNetService *)aNetService moreComing:(BOOL)moreComing {
    [self.foundServices removeObject:aNetService];
    if (!moreComing) {
        [self sendBatchUpdate];
    }
}

- (void)netServiceBrowserWillSearch:(NSNetServiceBrowser *)aNetServiceBrowser {
    self.foundServices = [NSMutableArray array];
}

@end
