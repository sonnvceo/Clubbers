//
//  MainViewController.h
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideShowView.h"
#import "TownDetailCell.h"
#import "MBProgressHUD.h"

@protocol TownDetailViewControllerDelegate;

@interface TownDetailViewController : UIViewController< SlideShowViewDelegate,
                                                        UITableViewDelegate,
                                                        UITableViewDataSource,
                                                        TownDetailCellDelegate,
                                                        MBProgressHUDDelegate> {
   BOOL isBtnReadmoreDelegate;
   float expandHeightCell;
   MBProgressHUD *HUD;
}
@property (nonatomic, assign) id <TownDetailViewControllerDelegate> delegate;
@property (assign, nonatomic) NSInteger townID;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)btnDismiss:(id)sender;
@end

@protocol TownDetailViewControllerDelegate
@optional

@end