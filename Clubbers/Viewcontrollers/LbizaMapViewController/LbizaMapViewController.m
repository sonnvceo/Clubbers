//
//  MainViewController.m
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import "LbizaMapViewController.h"
#import "SideMenu.h"
#import "LeftMenuViewController.h"
#import "ContentViewController.h"
#import "CustomTableCell.h"
#import <GoogleMaps/GoogleMaps.h>
@interface LbizaMapViewController () {
    SlideShowView *slideShowView;
    SideMenu *sideMenu;
    UIButton *btnBack;
    MapView* mapView;
}
@end

@implementation LbizaMapViewController
@synthesize btnBack;
@synthesize button1;
@synthesize buttonClub;
@synthesize buttonShopping;
@synthesize buttonRestaurant;
@synthesize buttonFavourite;
@synthesize subMapView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //
    self.view.layer.cornerRadius = 5;
    self.view.layer.masksToBounds = YES;
    // add buttons
    btnBack = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnBack setFrame: CGRectMake(10.0f, 20.0f, 30.0f, 30.0f)];
    [btnBack setBackgroundImage:[UIImage imageNamed:@"ic_back_disable.png"] forState:UIControlStateNormal];
    //[btnBack setBackgroundImage:[UIImage imageNamed:@"ic_back_disable.png"] forState:UIControlStateDisabled];
    [btnBack addTarget:self action:@selector(btnBackMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnBack];

    [button1 setBackgroundImage:[UIImage imageNamed:@"ic_map_item1_normal.png"] forState:UIControlStateDisabled];
    [button1 setBackgroundImage:[UIImage imageNamed:@"ic_map_item1_selected.png"] forState:UIControlStateNormal];
    
    [buttonClub setBackgroundImage:[UIImage imageNamed:@"ic_map_club_normal.png"] forState:UIControlStateDisabled];
    [buttonClub setBackgroundImage:[UIImage imageNamed:@"ic_map_club_selected.png"] forState:UIControlStateNormal];
    
    [buttonShopping setBackgroundImage:[UIImage imageNamed:@"ic_map_shopping_normal.png"] forState:UIControlStateDisabled];
    [buttonShopping setBackgroundImage:[UIImage imageNamed:@"ic_map_shopping_selected.png"] forState:UIControlStateNormal];

    [buttonRestaurant setBackgroundImage:[UIImage imageNamed:@"ic_map_restaurant_normal.png"] forState:UIControlStateDisabled];
    [buttonRestaurant setBackgroundImage:[UIImage imageNamed:@"ic_map_restaurant_selected.png"] forState:UIControlStateNormal];
    
    [buttonFavourite setBackgroundImage:[UIImage imageNamed:@"ic_map_fav_normal.png"] forState:UIControlStateDisabled];
    [buttonFavourite setBackgroundImage:[UIImage imageNamed:@"ic_map_fav_selected"] forState:UIControlStateNormal];
    
//    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:21.0229
//                                                            longitude:105.836
//                                                                 zoom:14];
//    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
//    mapView.myLocationEnabled = YES;
//    self.view = mapView;
//    
//    // Creates a marker in the center of the map.
//    GMSMarker *marker = [[GMSMarker alloc] init];
//    marker.position = CLLocationCoordinate2DMake(21.0229, 105.836);
//    marker.title = @"Sydney";
//    marker.snippet = @"Australia";
//    marker.map = mapView;
    mapView = [[MapView alloc] initWithXibFile:self];
    [subMapView addSubview:mapView];
}
- (IBAction)btnBackMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)button1:(id)sender {
    [self stateOfButon1:NO
          andButtonClub:YES
       andButonShopping:YES
     andButonRestaurant:YES
      andButonFavourite:YES];
}
- (IBAction)buttonClub:(id)sender {
    [self stateOfButon1:YES
          andButtonClub:NO
       andButonShopping:YES
     andButonRestaurant:YES
      andButonFavourite:YES];
}
- (IBAction)buttonShopping:(id)sender {
    [self stateOfButon1:YES
          andButtonClub:YES
       andButonShopping:NO
     andButonRestaurant:YES
      andButonFavourite:YES];
}
- (IBAction)buttonRestaurant:(id)sender {
    [self stateOfButon1:YES
          andButtonClub:YES
       andButonShopping:YES
     andButonRestaurant:NO
      andButonFavourite:YES];
}
- (IBAction)buttonFavourite:(id)sender {
    [self stateOfButon1:YES
          andButtonClub:YES
       andButonShopping:YES
     andButonRestaurant:YES
      andButonFavourite:NO];
}
- (void) stateOfButon1:(BOOL) isEnablebtn1
         andButtonClub:(BOOL) isEnablebtnClub
      andButonShopping:(BOOL) isEnablebtnShopping
    andButonRestaurant:(BOOL) isEnablebtnRestaurant
     andButonFavourite:(BOOL) isEnablebtnFavourite {
    if (isEnablebtn1)
        button1.enabled = YES;
    else
        button1.enabled = NO;
    if (isEnablebtnClub)
        buttonClub.enabled = YES;
    else
        buttonClub.enabled = NO;
    if (isEnablebtnShopping)
        buttonShopping.enabled = YES;
    else
        buttonShopping.enabled = NO;
    if (isEnablebtnRestaurant)
        buttonRestaurant.enabled = YES;
    else
        buttonRestaurant.enabled = NO;
    if (isEnablebtnFavourite)
        buttonFavourite.enabled = YES;
    else
        buttonFavourite.enabled = NO;
}
#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    CustomTableCell *cell = (CustomTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[CustomTableCell class]]) {
                cell = (CustomTableCell *) currentObject;
                break;
            }
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the cell...
//    NSString *lblTitleCell;
//    NSString *lblDetailCell;
//    NSURL *urlImageCell;
//    if (kindOfTableView == kCityViewController) {
//        TownModel *townModel = [tableDatasource objectAtIndex:indexPath.row];
//        lblTitleCell = townModel.townName;
//        lblDetailCell = townModel.townDescription;
//        urlImageCell = [NSURL URLWithString:townModel.townImage];
//    }
//    else if (kindOfTableView == kClubViewController) {
//        ClubModel *clubModel = [tableDatasource objectAtIndex:indexPath.row];
//        lblTitleCell = clubModel.clubName;
//        lblDetailCell = clubModel.clubDescription;
//        urlImageCell = [NSURL URLWithString:clubModel.clubImage];
//    }
//    [self downloadImageWithURL:urlImageCell completionBlock:^(BOOL succeeded, UIImage *image) {
//        if (succeeded) {
//            [cell.imgIcon setImage:image];
//        }
//    }];
//    cell.lblTitle.text = lblTitleCell;
//    cell.lbDetail.text = lblDetailCell;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
