//
//  CDMeteorClient.m
//  Cheekd
//
//  Created by Vincil Bishop on 7/8/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import "CDMeteorClient.h"

static CDMeteorClient *_sharedClient;

@implementation CDMeteorClient

+ (CDMeteorClient*) sharedClient
{
    if (!_sharedClient) {
        _sharedClient = [[CDMeteorClient alloc] initWithDDPVersion:@"pre2"];
    }
    
    return _sharedClient;
}

@end
