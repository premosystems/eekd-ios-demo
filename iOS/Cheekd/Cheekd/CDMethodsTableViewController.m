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

static NSString *testUserId;

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
    testUserId = [CDMeteorClient sharedClient].userId;
    
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
    
    if ([segue.identifier isEqualToString:@"/app/connection_request_with_encounter"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            // TODO: Change the parameter to an existing encounterId for which a connection does not exist.
            [[CDMeteorClient sharedClient] callMethodName:@"/app/connection_request_with_encounter" parameters:@[@"Fy5p4QSBXrDSAzFZL"] responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
        }];
    } else if ([segue.identifier isEqualToString:@"/app/create_encounter"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            // TODO: Change the request parameters to existing values
            NSArray *parameters = @[testUserId,[NSNumber numberWithFloat:38.360844],[NSNumber numberWithFloat:-81.620803]];
            [[CDMeteorClient sharedClient] callMethodName:@"/app/create_encounter" parameters:parameters responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
        }];
    } else if ([segue.identifier isEqualToString:@"/app/get_encounters_for_user"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            // TODO: Change the request parameters to existing values
            NSArray *parameters = @[testUserId];
            [[CDMeteorClient sharedClient] callMethodName:@"/app/get_encounters_for_user" parameters:parameters responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
        }];
    } else if ([segue.identifier isEqualToString:@"/app/get_my_connections"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/app/get_my_connections" parameters:nil responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
        }];
    } else if ([segue.identifier isEqualToString:@"/app/upsert_my_profile"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            [[CDMeteorClient sharedClient] callMethodName:@"/app/upsert_my_profile" parameters:@[@{@"displayName":[[NSDate date] description]}] responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
        }];
    } else if ([segue.identifier isEqualToString:@"/app/get_profile_for_user"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            // TODO: Change the request parameters to existing values
            NSArray *parameters = @[testUserId];
            [[CDMeteorClient sharedClient] callMethodName:@"/app/get_profile_for_user" parameters:parameters responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
        }];
    } else if ([segue.identifier isEqualToString:@"/app/register_conversation_for_connection"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            // TODO: Change the request parameters to existing values
            NSArray *parameters = @[@"connection_sdasdasdsd"];
            [[CDMeteorClient sharedClient] callMethodName:@"/app/register_conversation_for_connection" parameters:parameters responseCallback:^(NSDictionary *response, NSError *error) {
                
                [controller logResponse:response error:error];
                
            }];
        }];
    } else if ([segue.identifier isEqualToString:@"/app/layer/deleteUser"]) {
        
        [controller configureWithMethodBlock:^(CDMethodResultsViewController *resultsController) {
            
            // TODO: Change the request parameters to existing values
            NSArray *parameters = @[testUserId];
            [[CDMeteorClient sharedClient] callMethodName:@"/app/layer/deleteUser" parameters:parameters responseCallback:^(NSDictionary *response, NSError *error) {
                
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
