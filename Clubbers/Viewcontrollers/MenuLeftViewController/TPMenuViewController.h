//
//  TPMenuViewController.h
//  HiTaxi
//
//  Created by Nguyễn Hữu Hoà on 4/11/13.
//  Copyright (c) 2013 TOPPRO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityTableCell.h"
#import "MBProgressHUD.h"

@interface TPMenuViewController : UITableViewController<MBProgressHUDDelegate> {
    MBProgressHUD *HUD;
    NSArray *tableDatasource;
}
@property(assign, nonatomic) NSInteger kindOfTableView;
@end
