//
//  MainViewController.h
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideShowView.h"
#import "ClubDetailCell.h"
#import "MBProgressHUD.h"
#import "ClubDetailViewController.h"
@protocol ClubDetailViewControllerDelegate;

@interface ClubDetailViewController : UIViewController< SlideShowViewDelegate,
                                                        UITableViewDelegate,
                                                        UITableViewDataSource,
                                                        ClubDetailCellDelegate,
                                                        MBProgressHUDDelegate> {
   BOOL isBtnReadmoreDelegate;
   float expandHeightCell;
   MBProgressHUD *HUD;
}
@property (nonatomic, assign) id <ClubDetailViewControllerDelegate> delegate;
@property (assign, nonatomic) NSInteger townID;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
- (IBAction)btnDismiss:(id)sender;
@end

@protocol ClubDetailViewControllerDelegate
@optional

@end