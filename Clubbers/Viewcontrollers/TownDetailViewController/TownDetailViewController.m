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
#import "ContentViewController.h"
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
    
    self.navigationController.navigationBarHidden = YES;
    slideShowView = [[SlideShowView alloc] initWithXibFile:(id)self];
    slideShowView.typeOfViewController = kDetailViewController;
    [slideShowView autoSlideShowAnimation:images];
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
//        if (indexPath.row ==1) {
//            if (isBtnReadmoreDelegate)
//                cell.isBtnReadmore = YES;
//            [cell creatSubviews];
//        }
    }
    if (isBtnReadmoreDelegate)
        cell.isBtnReadmore = YES;
    [cell configueCellAtIndexPath:indexPath];
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
#pragma mark - TownDetailCell Delegate

- (void) didActivateReadMoreForCell:(TownDetailCell*)cell {
    isBtnReadmoreDelegate = YES;
    [_readMoreCells addObject:cell.indexPath];
    expandHeightCell = cell.realHeightOfTextView;
    [self.tableView reloadRowsAtIndexPaths:_readMoreCells withRowAnimation:UITableViewRowAnimationAutomatic];
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