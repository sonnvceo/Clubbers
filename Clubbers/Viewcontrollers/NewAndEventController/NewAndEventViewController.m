//
//  MainViewController.m
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import "NewAndEventViewController.h"
#import "SideMenu.h"
#import "LeftMenuViewController.h"
#import "ContentViewController.h"
#import "CustomTableCell.h"

@interface NewAndEventViewController () {
    SlideShowView *slideShowView;
    SideMenu *sideMenu;
    UIButton *btnBack;
}
@end

@implementation NewAndEventViewController
@synthesize buttonNews;
@synthesize buttonEvents;
@synthesize buttonOffers;
@synthesize tableview;
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

    
    [buttonNews setBackgroundImage:[UIImage imageNamed:@"ic_ne_news_normal.png"] forState:UIControlStateDisabled];
    [buttonNews setBackgroundImage:[UIImage imageNamed:@"ic_ne_news_selected.png"] forState:UIControlStateNormal];
    
    [buttonEvents setBackgroundImage:[UIImage imageNamed:@"ic_ne_events_normal.png"] forState:UIControlStateDisabled];
    [buttonEvents setBackgroundImage:[UIImage imageNamed:@"ic_ne_events_selected.png"] forState:UIControlStateNormal];
    
    [buttonOffers setBackgroundImage:[UIImage imageNamed:@"ic_ne_offers_normal.png"] forState:UIControlStateDisabled];
    [buttonOffers setBackgroundImage:[UIImage imageNamed:@"ic_ne_offers_selected"] forState:UIControlStateNormal];
    
    tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
}
- (IBAction)btnBackMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)btnNews:(id)sender {
    [self stateOfButonNews:NO andButtonEvents:YES andButonOffers:YES];
}
- (IBAction)btnEvents:(id)sender {
    [self stateOfButonNews:YES andButtonEvents:NO andButonOffers:YES];
}
- (IBAction)btnOffers:(id)sender {
    [self stateOfButonNews:NO andButtonEvents:YES andButonOffers:NO];
}
- (void) stateOfButonNews:(BOOL) isEnablebtnNews andButtonEvents:(BOOL) isEnablebtnEvents andButonOffers:(BOOL) isEnablebtnOffers {
    if (isEnablebtnNews) {
        buttonNews.enabled = YES;
    }
    else
        buttonNews.enabled = NO;
    if (isEnablebtnEvents) {
        buttonEvents.enabled = YES;
    }
    else
        buttonEvents.enabled = NO;
    if (isEnablebtnOffers) {
        buttonOffers.enabled = YES;
    }
    else
        buttonOffers.enabled = NO;
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
