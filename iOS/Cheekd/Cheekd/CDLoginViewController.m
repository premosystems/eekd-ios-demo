//
//  CDLoginViewController.m
//  Cheekd
//
//  Created by Vincil Bishop on 7/8/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import "CDLoginViewController.h"
#import "CDMeteorClient.h"

@interface CDLoginViewController ()

@end

@implementation CDLoginViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Facebook Login -

- (IBAction)facebookLogin:(id)sender {
    
    // If the session state is any of the two "open" states when the button is clicked
    if (FBSession.activeSession.state == FBSessionStateOpen
        || FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {
        
        // Close the session and remove the access token from the cache
        // The session state handler (in the app delegate) will be called automatically
        [FBSession.activeSession closeAndClearTokenInformation];
        
        // If the session state is not any of the two "open" states when the button is clicked
    } else {
        // Open a session showing the user the login UI
        // You must ALWAYS ask for public_profile permissions when opening a session
        [FBSession openActiveSessionWithReadPermissions:@[@"public_profile",@"user_photos"]
                                           allowLoginUI:YES
                                      completionHandler:
         ^(FBSession *session, FBSessionState state, NSError *error) {
             
             if (state == FBSessionStateOpen) {
                 
                 [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                     //[self.view hideProgressHUD];
                     if (!error) {
                         // Success! Include your code to handle the results here
                         NSLog(@"user info: %@", result);
                         
                         [self loginToMeteorWithFacebookData:result accessToken:session.accessTokenData.accessToken];
                         
                         [session setStateChangeHandler:NULL];
                         
                     } else {
                         // An error occurred, we need to handle the error
                         // See: https://developers.facebook.com/docs/ios/errors
                         NSLog(@"error: %@",[error localizedDescription]);
                     }
                 }];
             }
         }];
    }
}

- (void) loginToMeteorWithFacebookData:(NSDictionary*)fbData accessToken:(NSString*)accessToken
{
    NSDictionary *parameters = @{@"fbData":fbData,@"accessToken":accessToken};
    [[CDMeteorClient sharedClient] callMethodName:@"login" parameters:@[parameters] responseCallback:^(NSDictionary *response, NSError *error) {
        
        NSLog(@"Result: %@",response);
        
        [CDMeteorClient sharedClient].userId = [response valueForKeyPath:@"result.id"];
        [CDMeteorClient sharedClient]->_sessionToken = [response valueForKeyPath:@"result.token"];
        [[CDMeteorClient sharedClient] _setAuthStateToLoggedIn];
        
        [[CDMeteorClient sharedClient] callMethodName:@"/facebook/getUserInfo" parameters:nil responseCallback:^(NSDictionary *response, NSError *error) {
            
            NSLog(@"response: %@",response);
            
        }];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Storyboard" bundle:nil] instantiateViewControllerWithIdentifier:@"CDMethodNavigationController"];
            [self presentViewController:viewController animated:YES completion:NULL];
            
        }];
        
    }];
}

@end