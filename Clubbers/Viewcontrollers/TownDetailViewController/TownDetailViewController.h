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
@interface TownDetailViewController : UIViewController< SlideShowViewDelegate,
                                                        UITableViewDelegate,
                                                        UITableViewDataSource,
                                                        TownDetailCellDelegate> {
    
}

@property (strong, nonatomic) IBOutlet UIView *slideShowSubView;
@property (strong, nonatomic) IBOutlet UIView *sideMenuSubView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)btnDismiss:(id)sender;
@end
