//
//  MainViewController.m
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import "TownDetailViewController.h"
#import "SideMenu.h"
#import "LeftMenuViewController.h"
#import "TPMenuViewController.h"
#import "DefinitionAPI.h"
@interface TownDetailViewController () {
    SlideShowView *slideShowView;
    SideMenu *sideMenu;
    
}
@property (nonatomic) NSMutableArray * readMoreCells;
@end

@implementation TownDetailViewController
@synthesize slideShowSubView;
@synthesize sideMenuSubView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //
    self.view.layer.cornerRadius = 5;
    self.view.layer.masksToBounds = YES;
    
    self.navigationController.navigationBarHidden = YES;
    slideShowView = [[SlideShowView alloc] initWithXibFile:(id)self];
    slideShowView.typeOfViewController = kDetailViewController;
    [slideShowView stateOfButonMenuAndButtonBack:NO];
    [slideShowSubView addSubview:slideShowView];

//    [sideMenuSubView addSubview:sideMenu.view];
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
    if ([self.readMoreCells containsObject:@(indexPath.row)]) {
        return 300;
    }
    
    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
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
    static NSString *CellIdentifier = @"TownDetailCell";
    TownDetailCell *cell = (TownDetailCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"TownDetailCell" owner:self options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[TownDetailCell class]]) {
                cell = (TownDetailCell *) currentObject;
                break;
            }
        }
        cell.indexPath = indexPath;
        cell.delegate = self;
    }
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
#pragma mark - CZAPTableViewCell Delegate

- (void) didActivateReadMoreForCell:(TownDetailCell*)cell {
    
    NSLog(@"Clicked Cell %d", cell.indexPath.row);
    
    if ([self.readMoreCells containsObject:@(cell.indexPath.row)]) {
        [self.readMoreCells removeObject:@(cell.indexPath.row)];
    } else {
        [self.readMoreCells addObject:@(cell.indexPath.row)];
    }
    
    [self.tableView reloadRowsAtIndexPaths:[self.tableView indexPathsForVisibleRows] withRowAnimation:UITableViewRowAnimationAutomatic];
    
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
