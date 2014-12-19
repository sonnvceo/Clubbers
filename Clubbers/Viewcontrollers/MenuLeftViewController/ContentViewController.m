//
//  ContentViewController.m
//  HiTaxi
//
//  Created by Nguyễn Hữu Hoà on 4/11/13.
//  Copyright (c) 2013 TOPPRO. All rights reserved.
//

#import "ContentViewController.h"
#import "AFNetworking.h"
#import "TownModel.h"
#import "ClubModel.h"
#import "DefinitionAPI.h"
#import "TownDetailViewController.h"
#import "ClubDetailModel.h"

@interface ContentViewController ()
@end

@implementation ContentViewController
@synthesize kindOfTableView;
@synthesize delegate;
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
- (void) setSizeFrameTableView:(CGRect) frameSize {
    [self.tableView setFrame:CGRectMake(self.tableView.frame.origin.x,
                                        self.tableView.frame.origin.y,
                                        self.tableView.frame.size.width,
                                        frameSize.size.height)];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    if (delegate) {
        [delegate disableBackMenuButton];
        [delegate showMBProgressHUD];
    }
    [self.tableView setHidden:YES];
    if (kindOfTableView == kCityViewController)
        [self loadAllTowns];
    else if (kindOfTableView == kClubViewController)
        [self loadAllClubs];
    else if (kindOfTableView == kMyFavViewController)
        [self loadAllMyFav];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 180, 0);
}
-(void)loadAllTowns {
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:OFFICIAL_SERVER]];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:SA_TOWNS_LIST parameters:nil];
    NSLog(@" %@", [request description]);
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *requestOperation, id responseObject) {
        NSArray *jsonDataArray = [NSJSONSerialization JSONObjectWithData:requestOperation.responseData options:NSJSONReadingAllowFragments error:nil];
       tableDatasource = [[TownModel shareInstance] parseJson:jsonDataArray];
        [self.tableView setHidden:NO];
        if (delegate) {
            [delegate dismissMBProgressHUD];
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error:%@", error);
    }];
    
    [client enqueueHTTPRequestOperation:operation];
}
-(void)loadAllClubs{
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:OFFICIAL_SERVER]];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:@"sa_all_clubs" parameters:nil];
    NSLog(@" %@", [request description]);
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *requestOperation, id responseObject) {
        NSArray *jsonDataArray = [NSJSONSerialization JSONObjectWithData:requestOperation.responseData options:NSJSONReadingAllowFragments error:nil];
        tableDatasource = [[ClubModel shareInstance] parseJson:jsonDataArray];
        [self.tableView setHidden:NO];
        if (delegate) {
            [delegate dismissMBProgressHUD];
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error:%@", error);
    }];
    
    [client enqueueHTTPRequestOperation:operation];
}
-(void)loadAllMyFav {
    [self.tableView setHidden:NO];
    if (delegate)
        [delegate dismissMBProgressHUD];
    NSArray *jsonDataArray = [[ClubDetailModel shareInstance] getDataFromSQLite];
    tableDatasource = [[ClubModel shareInstance] parseJson:jsonDataArray];
    [self.tableView reloadData];
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
    return 60;
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
    else  {
        ClubModel *clubModel = [tableDatasource objectAtIndex:indexPath.row];
        lblTitleCell = clubModel.clubName;
        lblDetailCell = clubModel.clubDescription;
        urlImageCell = [NSURL URLWithString:clubModel.clubImage];
    }
    [self downloadImageWithURL:urlImageCell completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            [cell.imgShadowIcon setHidden:NO];
            [cell.imgIcon setImage:image];
        }
    }];
    cell.lblTitle.text = lblTitleCell;
    cell.lbDetail.text = lblDetailCell;
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (kindOfTableView == kCityViewController) {
        if (delegate) {
            [delegate presentToDetailViewController:(NSInteger)indexPath.row];
        }
    }
    else if (kindOfTableView == kClubViewController) {
        if (delegate) {
            [delegate presentToClubDetailViewController:(NSInteger)indexPath.row];
        }
    }
   
}

@end
