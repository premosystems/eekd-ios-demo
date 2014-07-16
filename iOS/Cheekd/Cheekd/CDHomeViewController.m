//
//  CDHomeViewController.m
//  Cheekd
//
//  Created by Vincil Bishop on 7/8/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import "CDHomeViewController.h"

@interface CDHomeViewController ()

@end

@implementation CDHomeViewController

#pragma mark - IBAction Methods -

- (IBAction)getPhotosPressed:(id)sender {
    
    
    [[CDMeteorClient sharedClient] callMethodName:@"/facebook/photo_albums" parameters:nil responseCallback:^(NSDictionary *response, NSError *error) {
    
        NSLog(@"response: %@",response);
    }];
    
}


@end
