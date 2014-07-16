//
//  CDMethodResultsViewController.h
//  Cheekd
//
//  Created by Vincil Bishop on 7/14/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CDMethodResultsViewController;

typedef void (^CDMethodBlock)(CDMethodResultsViewController *resultsController);

@interface CDMethodResultsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, copy) CDMethodBlock methodBlock;

- (void) configureWithMethodBlock:(CDMethodBlock)methodBlock;
- (void) logResponse:(NSDictionary*)response error:(NSError*)error;
- (void) log:(NSString*)message;

@end
