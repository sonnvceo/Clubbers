//
//  TPMenuViewController.m
//  HiTaxi
//
//  Created by Nguyễn Hữu Hoà on 4/11/13.
//  Copyright (c) 2013 TOPPRO. All rights reserved.
//

#import "TPMenuViewController.h"
#import "AFNetworking.h"
#import "TownModel.h"
#import "ClubModel.h"
#import "DefinitionAPI.h"

@interface TPMenuViewController ()
@end

@implementation TPMenuViewController
@synthesize kindOfTableView;
- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

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
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.navigationController.view addSubview:HUD];
    
    HUD.delegate = (id)self;
    HUD.labelText = @"Loading...";
    
    if (kindOfTableView == kCityViewController)
        [HUD showWhileExecuting:@selector(loadAllTowns) onTarget:self withObject:nil animated:YES];
    else if (kindOfTableView == kClubViewController)
        [HUD showWhileExecuting:@selector(loadAllClubs) onTarget:self withObject:nil animated:YES];
        
    
}
-(void)loadAllTowns {
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:URL_BASE]];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:@"sa_towns_list" parameters:nil];
    NSLog(@" %@", [request description]);
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *requestOperation, id responseObject) {
        NSArray *jsonDataArray = [NSJSONSerialization JSONObjectWithData:requestOperation.responseData options:NSJSONReadingAllowFragments error:nil];
       tableDatasource = [[TownModel shareInstance] parseJson:jsonDataArray];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error:%@", error);
    }];
    
    [client enqueueHTTPRequestOperation:operation];
}
-(void)loadAllClubs{
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:URL_BASE]];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:@"sa_clubs_list/?town_id=1" parameters:nil];
    NSLog(@" %@", [request description]);
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *requestOperation, id responseObject) {
        NSArray *jsonDataArray = [NSJSONSerialization JSONObjectWithData:requestOperation.responseData options:NSJSONReadingAllowFragments error:nil];
        tableDatasource = [[ClubModel shareInstance] parseJson:jsonDataArray];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error:%@", error);
    }];
    
    [client enqueueHTTPRequestOperation:operation];
}
- (void)viewDidUnload {
    [self.tableView removeFromSuperview];
    [self setTableView:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [tableDatasource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CityTableCell";
    CityTableCell *cell = (CityTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CityTableCell" owner:self options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[CityTableCell class]]) {
                cell = (CityTableCell *) currentObject;
                break;
            }
        }
        [cell configureCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the cell...
    NSString *lblTitleCell;
    NSString *lblDetailCell;
    NSURL *urlImageCell;
    if (kindOfTableView == kCityViewController) {
        TownModel *townModel = [tableDatasource objectAtIndex:indexPath.row];
        lblTitleCell = townModel.townName;
        lblDetailCell = townModel.townDescription;
        urlImageCell = [NSURL URLWithString:townModel.townImage];
    }
    else if (kindOfTableView == kClubViewController) {
        ClubModel *clubModel = [tableDatasource objectAtIndex:indexPath.row];
        lblTitleCell = clubModel.clubName;
        lblDetailCell = clubModel.clubDescription;
        urlImageCell = [NSURL URLWithString:clubModel.clubImage];
    }
    [self downloadImageWithURL:urlImageCell completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
             [cell.imgIcon setImage:image];
        }
    }];
    cell.lblTitle.text = lblTitleCell;
    cell.lbDetail.text = lblDetailCell;
    return cell;
}

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UINavigationController *navigationController = (UINavigationController *)[[self stackViewController] contentViewController];
//    if ([self contentViewcontrollerForIndexPath:indexPath]!= nil) {
//        [navigationController setViewControllers:@[[self contentViewcontrollerForIndexPath:indexPath]]];
//        
//        [[self stackViewController] hideLeftViewController];
}

@end
