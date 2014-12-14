//
//  ContentViewController.h
//  HiTaxi
//
//  Created by Nguyễn Hữu Hoà on 4/11/13.
//  Copyright (c) 2013 TOPPRO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityTableCell.h"
#import "MBProgressHUD.h"
@protocol ContentViewControllerDelegate;

@interface ContentViewController : UITableViewController {
    NSArray *tableDatasource;
}
@property (nonatomic, assign) id <ContentViewControllerDelegate> delegate;
@property(assign, nonatomic) NSInteger kindOfTableView;
- (void) setSizeFrameTableView:(CGRect) frameSize;
@end
@protocol ContentViewControllerDelegate
@optional
- (void) presentToViewController;
- (void) disableBackMenuButton;
- (void) showMBProgressHUD;
- (void) dismissMBProgressHUD;
@end

