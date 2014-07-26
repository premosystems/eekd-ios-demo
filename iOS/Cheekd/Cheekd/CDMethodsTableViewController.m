//
//  CDMethodsTableViewController.m
//  Cheekd
//
//  Created by Vincil Bishop on 7/14/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import "CDMethodsTableViewController.h"
#import "CDMethodResultsViewController.h"

@interface CDMethodsTableViewController ()

@end

@implementation CDMethodsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CDMethodResultsViewController *controller = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"getPhotos"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/facebook/currentUser/getProfilePhotos" parameters:nil responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
            
        }];
        
    } else if ([segue.identifier isEqualToString:@"getUserInfo"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/facebook/getUserInfo" parameters:nil responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"/app/encounter/create"]) {
        NSDictionary *nsDict = @{
                                    @"displayName" : @"Name",
                                    @"user1Id" :  @"user1",
                                    @"user2Id" : @"user2"
                                    };
        NSArray *params = @[nsDict];
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/app/encounter/create" parameters:params responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"/app/connection/create"]) {
        
        
        NSArray *params = @[@{@"displayName" : @"Name", @"userId" : @"user1"}];
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/app/connection/create" parameters:params responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"/app/conversation/create"]) {
        
        
        NSArray *params = @[@{@"displayName" : @"Name", @"user1Id" :  @"user1", @"user2Id" : @"user2"}];
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/app/conversation/create" parameters:params responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"/app/message/send"]) {
        
        
        NSArray *params = @[@{@"text" : @"Name",@"user1Id" :  @"user1",@"user2Id" : @"user2",@"conversationId": @"conversation"}];
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/app/message/send" parameters:params responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"/app/settings/update"]) {
    
        
        NSArray *params = @[@{@"userId":@"user", @"displayName" : @"Name"}];
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/app/settings/update" parameters:params responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"/app/tag/create"]) {
        
        
        NSArray *params = @[@{@"userId":@"user", @"displayName" : @"Name"}];
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/app/tag/create" parameters:params responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"/app/profile/Update"]) {
        
        
        NSArray *params = @[@{@"userId":@"user", @"displayName" : @"Name"}];
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/app/profile/Update" parameters:params responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"connection_index"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            
            [[NSNotificationCenter defaultCenter] addObserverForName:@"connection_added" object:nil queue:[NSOperationQueue new] usingBlock:^(NSNotification *note) {
                [controller logResponse:note.userInfo error:nil];
            }];
            
           [[CDMeteorClient sharedClient] addSubscription:@"connection_index"];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"conversation_index"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            [[CDMeteorClient sharedClient] addSubscription:@"conversation_index"];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"encounter_index"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
           [[CDMeteorClient sharedClient] addSubscription:@"encounter_index"];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"message_index"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
          [[CDMeteorClient sharedClient] addSubscription:@"message_index"];
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"profile_index"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
          [[CDMeteorClient sharedClient] addSubscription:@"profile_index"];
           
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"settings_index"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
          [[CDMeteorClient sharedClient] addSubscription:@"settings_index"];
         
            
        }];
        
    }
    else if ([segue.identifier isEqualToString:@"tag_index"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            [[CDMeteorClient sharedClient] addSubscription:@"tag_index"];
            
        }];
        
    } else if ([segue.identifier isEqualToString:@"/app/layer/createUser"]) {
        
        NSArray *params = @[[CDMeteorClient sharedClient].userId];
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/app/layer/createUser" parameters:params responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
        }];
    }
    
    else if ([segue.identifier isEqualToString:@"/app/layer/deleteUser"]) {
        
        NSArray *params = @[[CDMeteorClient sharedClient].userId];
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/app/layer/deleteUser" parameters:params responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
        }];
    }
}

/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
*/

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*

*/

@end
