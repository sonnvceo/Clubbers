//
//  MainViewController.m
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import "ClubDetailViewController.h"
#import "SideMenu.h"
#import "LeftMenuViewController.h"
#import "ContentViewController.h"
#import "DefinitionAPI.h"
#import "AFNetworking.h"
#import "TownDetailModel.h"

@interface ClubDetailViewController () {
    SlideShowView *slideShowView;
    SideMenu *sideMenu;
    TownDetailModel *townDetailModel;
}
@property (nonatomic) NSMutableArray * readMoreCells;
@end

@implementation ClubDetailViewController
@synthesize townID, delegate, tableview;

- (NSMutableArray *) readMoreCells {
    if (!_readMoreCells) {
        _readMoreCells = [@[] mutableCopy];
    }
    
    return _readMoreCells;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //
    UIImage*i1 = [UIImage imageNamed:@"1.jpg"];
    UIImage*i2 = [UIImage imageNamed:@"2.jpg"];
    UIImage*i3 = [UIImage imageNamed:@"3.jpg"];
    UIImage*i4 = [UIImage imageNamed:@"4.jpg"];
    UIImage*i5 = [UIImage imageNamed:@"5.jpg"];
    NSArray *images = @[i1,i2,i3,i4,i5];
    
    self.view.layer.cornerRadius = 5;
    self.view.layer.masksToBounds = YES;
    CGRect frameSlideShowView = CGRectMake(0, 0,self.view.bounds.size.width, 180);
    slideShowView = [[SlideShowView alloc] initWithFrame:frameSlideShowView];
    slideShowView.delegate = (id)self;
    slideShowView.typeOfViewController = kMasterViewController;
    [slideShowView autoSlideShowAnimation:images];
    [slideShowView stateOfButonMenuAndButtonBack:NO];
    [self.view addSubview:slideShowView];
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.delegate = (id)self;
    HUD.labelText = @"Loading...";
    [self showMBProgressHUDAtDetailView:YES];
    [self loadDetailTown];
}
-(void)loadDetailTown {
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:OFFICIAL_SERVER]];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:[NSString stringWithFormat:@"%@%ld", SA_TOWN_DETAILS, townID+1
                                                                   ] parameters:nil];
    NSLog(@" %@", [request description]);
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *requestOperation, id responseObject) {
         NSDictionary* dictResponse = [NSJSONSerialization JSONObjectWithData:requestOperation.responseData options:NSJSONReadingAllowFragments error:nil];
        townDetailModel = [[TownDetailModel shareInstance] parseJson:dictResponse];
        [tableview reloadData];
        [self showMBProgressHUDAtDetailView:NO];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error:%@", error);
    }];
    
    [client enqueueHTTPRequestOperation:operation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnDismiss:(id)sender {
   [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if ([self.readMoreCells containsObject:@(indexPath.row)]) {
//        return 300;
//    }
    float heightOfCell;
    switch (indexPath.row) {
        case 0:
            heightOfCell = 60;
            break;
        case 1:
            heightOfCell = 300;
            break;
        default:
            break;
    }
    if ([self.readMoreCells containsObject:indexPath]) {
        heightOfCell += expandHeightCell - 65.0f;
    }
    return heightOfCell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
/*
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
 */
    static NSString *CellIdentifier = @"ClubDetailCell";
    ClubDetailCell *cell = (ClubDetailCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ClubDetailCell" owner:self options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[ClubDetailCell class]]) {
                cell = (ClubDetailCell *) currentObject;
                break;
            }
        }
        cell.indexPath = indexPath;
        cell.delegate = self;
//        if (indexPath.row ==1) {
//            if (isBtnReadmoreDelegate)
//                cell.isBtnReadmore = YES;
//            [cell creatSubviews];
//        }
    }
    if (isBtnReadmoreDelegate)
    cell.isBtnReadmore = YES;
    [cell configueCellAtIndexPath:indexPath withTownDetai:townDetailModel];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    
    
}
- (void) showMBProgressHUDAtDetailView:(BOOL) isShowHUB {
    if (isShowHUB)
        [HUD show:TRUE];
    else
        [HUD hide:TRUE];
}
#pragma mark - TownDetailCell Delegate

- (void) didActivateReadMoreForCell:(ClubDetailCell*)cell {
    isBtnReadmoreDelegate = YES;
    [_readMoreCells addObject:cell.indexPath];
    expandHeightCell = cell.realHeightOfTextView;
    [tableview reloadRowsAtIndexPaths:_readMoreCells withRowAnimation:UITableViewRowAnimationAutomatic];
}
#pragma mark - SlideShowViewDelegate
- (void) showMenuLeft{
    [sideMenu showMenuAnimated:YES];
}
- (void)showMenuRight {
    [sideMenu hideMenuAnimated:YES];
}
- (void)popToRootViewController {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
