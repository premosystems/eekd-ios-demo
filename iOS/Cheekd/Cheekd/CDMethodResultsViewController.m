//
//  CDMethodResultsViewController.m
//  Cheekd
//
//  Created by Vincil Bishop on 7/14/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import "CDMethodResultsViewController.h"

@interface CDMethodResultsViewController ()

@end

@implementation CDMethodResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.methodBlock(self);
    
}

- (void) configureWithMethodBlock:(CDMethodBlock)methodBlock
{
    self.methodBlock = methodBlock;
}

- (void) logResponse:(NSDictionary*)response error:(NSError*)error
{
    if (error) {
        
        [self log:[error localizedDescription]];
        
    } else {
        
        [self log:[response description]];
    }
}

- (void) log:(NSString*)message
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.textView.text = [NSString stringWithFormat:@"%@\n%@",self.textView.text,message];
    }];
    
}

@end
